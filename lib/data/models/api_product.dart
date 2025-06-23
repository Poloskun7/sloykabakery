import 'package:sloykabakery/domain/models/product.dart';

class ApiProduct {
  final int categoryId;
  final String name;
  final String description;
  final int price;

  ApiProduct({required this.categoryId, required this.name, required this.description, required this.price});
  
  factory ApiProduct.fromJson(Map<String, dynamic> json) {
    return ApiProduct(
      categoryId: json['categoryId'],
      name: json['name'],
      description: json['description'],
      price: json['price']
    );
  }

  Product toDomain() {
    return Product(
      categoryId: categoryId,
      name: name,
      description: description,
      price: price
    );
  }
}