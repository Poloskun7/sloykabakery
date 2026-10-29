import 'package:sloykabakery/features/menu/domain/category.dart';
import 'package:sloykabakery/features/menu/domain/menu_data.dart';
import 'package:sloykabakery/features/menu/domain/product.dart';

MenuData createTestMenuData() {
  return MenuData(
    categories: [Category(id: 1, name: "Десерты")],
    products: [
      Product(
        categoryId: 1,
        name: "Тирамису",
        description: '',
        price: 100,
        imageUrl: null,
      ),
    ],
  );
}

MenuData createEmptyTestMenuData() {
  return MenuData(categories: [], products: []);
}
