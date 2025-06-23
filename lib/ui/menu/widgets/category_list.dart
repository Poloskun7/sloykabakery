import 'package:flutter/material.dart';
import 'package:sloykabakery/domain/models/category.dart';
import 'package:sloykabakery/ui/menu/widgets/category_item.dart';

class CategoryList extends StatelessWidget {
  final List<Category> categories;

  const CategoryList({super.key, required this.categories});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          padding: const EdgeInsets.symmetric(vertical: 8),
          child: Row(
            children: [
              const SizedBox(width: 16),
              ...categories.map(
                (category) => CategoryItem(category: category),
              ),
              const SizedBox(width: 16),
            ],
          ),
        );
  }
}