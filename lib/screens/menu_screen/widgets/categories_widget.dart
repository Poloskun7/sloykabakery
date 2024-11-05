import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sloykabakery/screens/menu_screen/menu_screen.dart';
import 'package:sloykabakery/themes/app_themes.dart';

class CategoriesWidget extends ConsumerWidget {
  const CategoriesWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final categories = ref.watch(categoriesProvider);
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          ...categories,
        ],
      ),
    );
  }
}

class CategoryWidget extends ConsumerWidget {
  final int id;
  final String name;

  const CategoryWidget({super.key, required this.id, required this.name});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedCategoryId = ref.watch(selectedCategoryProvider);
    return TextButton(
      style: ButtonStyle(backgroundColor: WidgetStateProperty.all(selectedCategoryId == id ? AppColors.richPurplishRedColor : Colors.transparent)),
      onPressed: () {
        ref.read(selectedCategoryProvider.notifier).state = id;
      },
      child: Text(
        name,
        style: TextStyle(color: selectedCategoryId == id ? AppColors.whiteColor : AppColors.blackColor),
      ),
    );
  }
}