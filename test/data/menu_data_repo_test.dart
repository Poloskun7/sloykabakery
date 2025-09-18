import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:sloykabakery/core/exceptions/exceptions.dart';
import 'package:sloykabakery/data/services/api_service.dart';
import 'package:sloykabakery/data/repositories/menu_data_repo.dart';

import '../../testing/fakes/mock_api_service.dart';
import '../../testing/models/test_api_menu_data.dart';
import '../../testing/models/test_exceptions.dart';

void main() {
  late MenuDataRepo repository;
  late ApiService mockApiService;

  setUp(() {
    mockApiService = MockApiService();
    repository = MenuDataRepo(mockApiService);
  });

  group('MenuDataRepo successful cases', () {
    test('converts ApiMenuData to MenuData correctly', () async {
      when(() => mockApiService.fetchMenuData())
          .thenAnswer((_) async => createTestApiMenuData());

      final result = await repository.getMenuData();

      expect(result.categories.first.name, "Десерты");
      expect(result.products.first.name, "Тирамису");
    });
  });

  group('MenuDataRepo failure cases', () {
    test('converts ApiMenuData to MenuData when API returns empty data',
        () async {
      when(() => mockApiService.fetchMenuData())
          .thenAnswer((_) async => createEmptyTestApiMenuData());

      expect(
        () => repository.getMenuData(),
        throwsA(isA<DataValidationException>()),
      );
    });
  });

  group('MenuDataRepo exception handling', () {
    test('throws NoInternetException when no connection', () async {
      when(() => mockApiService.fetchMenuData())
          .thenThrow(createTestNoInternetException());

      expect(
        () => repository.getMenuData(),
        throwsA(isA<NoInternetException>()),
      );
    });

    test('throws ApiTimeoutException', () async {
      when(() => mockApiService.fetchMenuData())
          .thenThrow(createTestApiTimeoutException());

      expect(
        () => repository.getMenuData(),
        throwsA(isA<ApiTimeoutException>()),
      );
    });

    test('throws ApiException on server error', () async {
      when(() => mockApiService.fetchMenuData())
          .thenThrow(createTestApiException());

      expect(
        () => repository.getMenuData(),
        throwsA(isA<ApiException>()),
      );
    });

    test('throws DataValidationException when empty product name', () async {
      final testData = createEmptyTestApiMenuData();

      when(() => mockApiService.fetchMenuData())
          .thenAnswer((_) async => testData);

      expect(
        () => repository.getMenuData(),
        throwsA(isA<DataValidationException>()),
      );
    });

    test('converts unknown exceptions to AppException', () async {
      when(() => mockApiService.fetchMenuData())
          .thenThrow(Exception('Unknown error'));

      expect(
        () => repository.getMenuData(),
        throwsA(isA<AppException>()),
      );
    });
  });

}
