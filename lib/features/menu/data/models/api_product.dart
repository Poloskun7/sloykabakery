import 'package:sloykabakery/features/menu/domain/product.dart';

import '../../../../core/network/json_fields.dart';

class ApiProduct {
  final int? id;
  final int categoryId;
  final String name;
  final String description;
  final int price;
  final String? imageUrl;

  ApiProduct({
    this.id,
    required this.categoryId,
    required this.name,
    required this.description,
    required this.price,
    required this.imageUrl,
  });

  factory ApiProduct.fromJson(Map<String, dynamic> json) {
    return ApiProduct(
      id: optionalJsonField<int>(json, 'id'),
      categoryId: jsonField<int>(
        jsonObject(json['category'], 'category'),
        'id',
      ),
      name: jsonField<String>(json, 'name'),
      description: jsonField<String>(json, 'description'),
      price: jsonField<int>(json, 'price'),
      imageUrl: optionalJsonField<String>(json, 'photo'),
    );
  }

  Product toDomain() {
    return Product(
      id: id,
      categoryId: categoryId,
      name: name,
      description: description,
      price: price,
      imageUrl: imageUrl,
    );
  }
}
