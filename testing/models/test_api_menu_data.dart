import 'package:sloykabakery/data/models/api_menu_data.dart';
import 'package:sloykabakery/data/models/api_category.dart';
import 'package:sloykabakery/data/models/api_product.dart';

ApiMenuData createTestApiMenuData() {
  return ApiMenuData(
    categories: {
      ApiCategory(id: 1, name: "Десерты"),
    },
    products: [
      ApiProduct(categoryId: 1, name: "Тирамису", description: '', price: 100),
    ],
  );
}

ApiMenuData createEmptyTestApiMenuData() {
  return ApiMenuData(
    categories: {},
    products: [],
  );
}