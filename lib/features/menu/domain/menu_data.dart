import 'package:hive/hive.dart';
import 'package:sloykabakery/features/menu/domain/category.dart';
import 'package:sloykabakery/features/menu/domain/product.dart';

part 'menu_data.g.dart';

@HiveType(typeId: 0)
class MenuData {
  @HiveField(0)
  final List<Product> products;

  @HiveField(1)
  final List<Category> categories;

  MenuData({required this.products, required this.categories});
}
