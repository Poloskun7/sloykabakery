import 'package:dio/dio.dart';
import 'package:sloykabakery/core/network/api_service.dart';
import 'package:sloykabakery/features/menu/data/models/api_menu_data.dart';
import 'package:sloykabakery/features/cafes/data/models/api_cafe.dart';

class FakeApiService implements ApiService {
  @override
  final Dio dio;

  FakeApiService({required this.dio});

  @override
  Future<ApiMenuData> fetchMenuData() async {
    return ApiMenuData(products: [], categories: {});
  }

  @override
  Future<List<ApiCafe>> fetchCafes() async {
    return [];
  }
}
