import 'package:sloykabakery/core/exceptions/exceptions.dart';
import 'package:sloykabakery/data/services/api_service.dart';
import 'package:sloykabakery/domain/models/menu_data.dart';

import 'dart:developer' as dev;

class MenuDataRepo {
  final ApiService apiService;

  MenuDataRepo(this.apiService);

  Future<MenuData> getMenuData() async {
    try {
      final apiMenuData = await apiService.fetchMenuData();

      if (apiMenuData.categories.isEmpty) {
        throw const DataValidationException(
            'No categories found');
      }

      if (apiMenuData.products.any((p) => p.name.isEmpty)) {
        throw const DataValidationException('The product name cannot be empty',
            field: 'product.name');
      }

      if (apiMenuData.products.any((p) => p.price <= 0)) {
        throw const DataValidationException('The price should be positive',
            field: 'product.price');
      }

      return apiMenuData.toDomain();
    } on AppException {
      rethrow;
    } catch (e, s) {
      dev.log('Unexpected repository error', error: e, stackTrace: s);
      throw const AppException('Failed to load menu data');
    }
  }
}
