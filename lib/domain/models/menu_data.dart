import 'package:sloykabakery/domain/models/category.dart';
import 'package:sloykabakery/domain/models/product.dart';

class MenuData {
  final List<Product> products;
  final Set<Category> categories;

  MenuData({required this.products, required this.categories});
}