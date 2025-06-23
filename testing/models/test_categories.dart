import 'package:sloykabakery/domain/models/category.dart';

class TestCategories {
  static List<Category> all() => [
    Category(id: 1, name: "Десерты"),
    Category(id: 2, name: "Напитки"),
    Category(id: 3, name: "Выпечка"),
  ];

  static List<Category> empty() => [];
}