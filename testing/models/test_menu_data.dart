import 'package:sloykabakery/domain/models/category.dart';
import 'package:sloykabakery/domain/models/menu_data.dart';
import 'package:sloykabakery/domain/models/product.dart';

MenuData createTestMenuData() {
  return MenuData(
    categories: {
      Category(id: 1, name: "Десерты"),
    },
    products: [
      Product(categoryId: 1, name: "Тирамису", description: '', price: 100),
    ],
  );
}

MenuData createEmptyTestMenuData() {
  return MenuData(
    categories: {},
    products: [],
  );
}