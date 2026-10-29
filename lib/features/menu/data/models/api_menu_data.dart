import 'package:sloykabakery/features/menu/data/models/api_product.dart';
import 'package:sloykabakery/features/menu/data/models/api_category.dart';
import 'package:sloykabakery/features/menu/domain/menu_data.dart';

import '../../../../core/network/json_fields.dart';

class ApiMenuData {
  final List<ApiProduct> products;
  final Set<ApiCategory> categories;

  ApiMenuData({required this.products, required this.categories});

  factory ApiMenuData.fromJson(List<dynamic> json) {
    return ApiMenuData(
      products: json
          .map((e) => ApiProduct.fromJson(jsonObject(e, 'product')))
          .toList(),
      categories: json
          .map((e) => ApiCategory.fromJson(jsonObject(e, 'product')))
          .toSet(),
    );
  }

  MenuData toDomain() {
    return MenuData(
      products: products.map((p) => p.toDomain()).toList(),
      categories: categories.map((c) => c.toDomain()).toList(),
    );
  }
}
