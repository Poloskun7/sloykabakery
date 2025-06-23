import 'package:sloykabakery/data/models/api_product.dart';
import 'package:sloykabakery/data/models/api_category.dart';
import 'package:sloykabakery/domain/models/menu_data.dart';

class ApiMenuData {
  final List<ApiProduct> products;
  final Set<ApiCategory> categories;

  ApiMenuData({required this.products, required this.categories});

  MenuData toDomain() {
    return MenuData(
      products: products.map((p) => p.toDomain()).toList(),
      categories: categories.map((c) => c.toDomain()).toSet(),
    );
  }
}
