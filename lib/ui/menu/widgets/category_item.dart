import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sloykabakery/domain/models/category.dart';
import 'package:sloykabakery/providers/category_provider.dart';
import 'package:sloykabakery/ui/core/themes/colors.dart';

class CategoryItem extends ConsumerWidget {
  final Category category;

  const CategoryItem({super.key, required this.category});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedCategoryId = ref.watch(selectedCategoryProvider);
    return TextButton(
      style: ButtonStyle(backgroundColor: WidgetStateProperty.all(selectedCategoryId == category.id ? AppColors.richPurplishRedColor : Colors.transparent)),
      onPressed: () {
        ref.read(selectedCategoryProvider.notifier).state = category.id;
      },
      child: Text(
        category.name,
        style: TextStyle(color: selectedCategoryId == category.id ? AppColors.whiteColor : AppColors.blackColor),
      ),
    );
  }
}