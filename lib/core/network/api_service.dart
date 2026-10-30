import 'package:dio/dio.dart';
import 'package:sloykabakery/core/exceptions.dart';
import 'package:sloykabakery/features/menu/data/models/api_menu_data.dart';

import '../config/api_config.dart';
import '../../features/cafes/data/models/api_cafe.dart';

import 'json_fields.dart';

class ApiService {
  final Dio dio;

  ApiService({Dio? dio})
    : dio =
          dio ??
          Dio(
            BaseOptions(
              baseUrl: ApiConfig.baseUrl,
              headers: {'sltoken': ApiConfig.token},
              connectTimeout: const Duration(seconds: 10),
              receiveTimeout: const Duration(seconds: 10),
              validateStatus: (status) => status == 200,
            ),
          );

  Future<ApiMenuData> fetchMenuData() async {
    final response = await _safeRequest(() => dio.get('/products/'));

    return ApiMenuData.fromJson(response.data);
  }

  Future<List<ApiCafe>> fetchCafes() async {
    final response = await _safeRequest(() => dio.get('/caffe/'));

    return (response.data as List)
        .map((e) => ApiCafe.fromJson(jsonObject(e, 'cafe')))
        .toList();
  }

  Future<Response<T>> _safeRequest<T>(
    Future<Response<T>> Function() request,
  ) async {
    try {
      final response = await request();
      if (response.data is! List) {
        throw const DataValidationException('Invalid response format');
      }
      return response;
    } on DioException catch (e) {
      if (e.error is FormatException) {
        throw const DataValidationException('Invalid JSON response');
      }
      if (e.type == DioExceptionType.connectionTimeout ||
          e.type == DioExceptionType.receiveTimeout ||
          e.type == DioExceptionType.sendTimeout) {
        throw const ApiTimeoutException();
      }

      if (e.response != null) {
        throw ApiException(
          'Server request failed',
          statusCode: e.response?.statusCode,
        );
      }
      // Do not include Dio diagnostics: they can contain authentication headers.
      throw const NetworkException('Could not reach the API');
    }
  }
}
