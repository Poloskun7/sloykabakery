import 'package:dio/dio.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:sloykabakery/core/exceptions/exceptions.dart';
import 'package:sloykabakery/data/models/api_menu_data.dart';
import 'package:sloykabakery/data/models/api_category.dart';
import 'package:sloykabakery/data/models/api_product.dart';
// import 'package:sloykabakery/data/models/api_cafe.dart';

import 'dart:developer' as dev;

class ApiService {
  final Dio dio;
  final InternetConnectionChecker internetConnectionChecker;

  ApiService({Dio? dio, InternetConnectionChecker? internetConnectionChecker})
      : dio = dio ?? Dio(),
        internetConnectionChecker =
            internetConnectionChecker ?? InternetConnectionChecker.instance;

  Future<ApiMenuData> fetchMenuData() async {
    const String baseUrl = 'https://api.soft4web.ru/sl/products/';
    const String token = '32232';

    final bool isConnected = await internetConnectionChecker.hasConnection;

    if (!isConnected) {
      dev.log('No internet connection');
      throw const NoInternetException();
    }

    try {
      final response = await dio.get(baseUrl,
          options: Options(headers: {'sltoken': token}, 
          // receiveTimeout: 10
          ));
      // response.statusCode = 500;

      _validateResponse(response);

      final apiProducts = <ApiProduct>[];
      final apiCategories = <ApiCategory>{};

      for (var item in response.data) {
        apiCategories.add(ApiCategory(
            id: item['category']['id'], name: item['category']['name']));
        apiProducts.add(ApiProduct(
            categoryId: item['category']['id'],
            name: item['name'],
            description: item['description'],
            price: item['price']));
      }
      return ApiMenuData(products: apiProducts, categories: apiCategories);
    } on DioException catch (e, s) {
      dev.log('Dio error', error: e, stackTrace: s);

      if (e.type == DioExceptionType.connectionTimeout ||
          e.type == DioExceptionType.receiveTimeout) {
        throw const ApiTimeoutException();
      }

      if (e.response != null) {
        throw ApiException(
          'Server error: ${e.response?.statusMessage ?? 'Unknown'}',
          statusCode: e.response?.statusCode,
        );
      }

      throw NetworkException('Network error: ${e.message}');
    } catch (e, s) {
      dev.log('Unexpected API error', error: e, stackTrace: s);
      throw const NetworkException('Unexpected network error');
    }
  }

  void _validateResponse(Response response) {
    if (response.statusCode != 200) {
      throw ApiException(
        'Invalid status code',
        statusCode: response.statusCode,
      );
    }

    if (response.data == null || response.data is! List) {
      throw const DataValidationException('Invalid response format');
    }
  }

  // Future<List<ApiCafe>> fetchCafes() async {
  //   var headers = {
  //     'sltoken': '32232',
  //   };

  //   final dio = Dio();
  //   final response = await dio.get(
  //     'https://r24api.photonhost.net/sl/caffe/',
  //   );

  //   List<ApiCafe> apiCafes = [];
  //   for (var item in response.data) {
  //     apiCafes.add(ApiCafe(
  //         address: item['address'],
  //         time: item['time'],
  //         extra: item['extra'],
  //         latitude: item['latitude'],
  //         longitude: item['longitude']));
  //   }
  //   return apiCafes;
  // }
}
