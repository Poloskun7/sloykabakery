import 'package:sloykabakery/features/menu/domain/category.dart';

class TestCategoryList {
  static List<Category> all() => [
    Category(id: 1, name: "Десерты"),
    Category(id: 2, name: "Напитки"),
    Category(id: 3, name: "Выпечка"),
  ];

  static List<Category> empty() => [];
}
