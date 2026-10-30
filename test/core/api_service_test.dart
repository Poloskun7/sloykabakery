import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:sloykabakery/core/exceptions.dart';
import 'package:sloykabakery/core/network/api_service.dart';

import '../../testing/fakes/mock_dio.dart';
import '../../testing/models/test_response_data.dart';

void main() {
  late MockDio mockDio;
  late ApiService apiService;

  setUp(() {
    mockDio = MockDio();
    apiService = ApiService(dio: mockDio);
  });

  test('malformed JSON is a data error, not an offline fallback', () async {
    when(() => mockDio.get('/products/')).thenThrow(
      DioException(
        requestOptions: RequestOptions(path: '/products/'),
        error: const FormatException('Invalid JSON'),
      ),
    );
    await expectLater(
      apiService.fetchMenuData(),
      throwsA(isA<DataValidationException>()),
    );
  });

  test('server diagnostics do not leak response contents', () async {
    when(() => mockDio.get('/products/')).thenThrow(
      DioException(
        type: DioExceptionType.badResponse,
        requestOptions: RequestOptions(path: '/products/'),
        response: Response(
          statusCode: 403,
          data: 'private-server-debug-data',
          requestOptions: RequestOptions(path: '/products/'),
        ),
      ),
    );
    try {
      await apiService.fetchMenuData();
      fail('Expected an API error');
    } on ApiException catch (error) {
      expect(error.statusCode, 403);
      expect(error.toString(), isNot(contains('private-server-debug-data')));
    }
  });

  group('fetchMenuData successful cases', () {
    test('fetchMenuData successful', () async {
      when(() => mockDio.get('/products/')).thenAnswer(
        (_) async => Response(
          data: createTestResponseData(),
          statusCode: 200,
          requestOptions: RequestOptions(path: '/products/'),
        ),
      );

      final result = await apiService.fetchMenuData();

      expect(result.categories.first.name, 'Десерты');
      expect(result.products.first.name, 'Тирамису');
    });
  });

  group('fetchMenuData exception handling', () {
    test('no internet connection', () async {
      when(() => mockDio.get('/products/')).thenThrow(
        DioException(
          type: DioExceptionType.connectionError,
          requestOptions: RequestOptions(path: '/products/'),
        ),
      );

      expect(
        () => apiService.fetchMenuData(),
        throwsA(isA<NetworkException>()),
      );
    });

    test('ApiTimeoutException', () async {
      when(() => mockDio.get('/products/')).thenThrow(
        DioException(
          type: DioExceptionType.connectionTimeout,
          requestOptions: RequestOptions(path: '/products/'),
        ),
      );

      expect(
        () => apiService.fetchMenuData(),
        throwsA(isA<ApiTimeoutException>()),
      );
    });

    test('Invalid status code', () async {
      when(() => mockDio.get('/products/')).thenThrow(
        DioException(
          type: DioExceptionType.badResponse,
          requestOptions: RequestOptions(path: '/products/'),
          response: Response(
            statusCode: 500,
            data: [],
            requestOptions: RequestOptions(path: '/products/'),
          ),
        ),
      );

      expect(() => apiService.fetchMenuData(), throwsA(isA<ApiException>()));
    });
  });
}
