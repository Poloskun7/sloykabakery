import 'package:flutter/material.dart';

import '../../../domain/models/category.dart';
import '../../core/themes/colors.dart';

class CategoryList extends StatelessWidget {
  final List<Category> categories;
  final int selectedId;
  final void Function(int) onSelect;

  const CategoryList({
    super.key,
    required this.categories,
    required this.selectedId,
    required this.onSelect,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        children: [
          const SizedBox(width: 16),
          ...categories.map(
            (category) => TextButton(
              style: ButtonStyle(
                backgroundColor: WidgetStateProperty.all(
                  selectedId == category.id
                      ? AppColors.richPurplishRedColor
                      : Colors.transparent,
                ),
              ),
              onPressed: () => onSelect(category.id),
              child: Text(
                category.name,
                style: TextStyle(
                  color: selectedId == category.id
                      ? AppColors.whiteColor
                      : AppColors.blackColor,
                ),
              ),
            ),
          ),
          const SizedBox(width: 16),
        ],
      ),
    );
  }
}
