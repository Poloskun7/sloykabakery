import 'package:sloykabakery/features/menu/domain/category.dart';

import '../../../../core/network/json_fields.dart';

class ApiCategory {
  final int id;
  final String name;

  ApiCategory({required this.id, required this.name});

  factory ApiCategory.fromJson(Map<String, dynamic> json) {
    return ApiCategory(
      id: jsonField<int>(jsonObject(json['category'], 'category'), 'id'),
      name: jsonField<String>(jsonObject(json['category'], 'category'), 'name'),
    );
  }

  Category toDomain() {
    return Category(id: id, name: name);
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) || (other is ApiCategory && id == other.id);

  @override
  int get hashCode => id.hashCode;
}
