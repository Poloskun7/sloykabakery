import 'package:hive/hive.dart';

part 'product.g.dart';

@HiveType(typeId: 1)
class Product {
  @HiveField(0)
  final int categoryId;

  @HiveField(1)
  final String name;

  @HiveField(2)
  final String description;

  @HiveField(3)
  final int price;

  @HiveField(4)
  final String? imageUrl;

  @HiveField(5)
  final int? id;

  // Old cached products have no ID; keep their saved favorites recognizable.
  String get legacyFavoriteKey => '$categoryId:$name';
  String get favoriteKey => id == null ? legacyFavoriteKey : 'id:$id';

  Product({
    this.id,
    required this.categoryId,
    required this.name,
    required this.description,
    required this.price,
    required this.imageUrl,
  });
}
