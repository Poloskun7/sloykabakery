import 'package:sloykabakery/domain/models/category.dart';

class ApiCategory {
  final int id;
  final String name;

  ApiCategory({required this.id, required this.name});

  factory ApiCategory.fromJson(Map<String, dynamic> json) {
    return ApiCategory(
      id: json['id'],
      name: json['name']
    );
  }

  Category toDomain() {
    return Category(
      id: id,
      name: name
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) || 
      (other is ApiCategory && id == other.id);

  @override
  int get hashCode => id.hashCode;
}