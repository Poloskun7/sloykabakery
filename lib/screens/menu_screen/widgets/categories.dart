import 'package:flutter/material.dart';
import 'package:sloykabakery/themes/app_theme.dart';

class Categories extends StatefulWidget {
  const Categories({super.key});

  @override
  CategoriesState createState() => CategoriesState();
}

class CategoriesState extends State<Categories> {
  // Список категорий
  final List<Category> categories = const [
    Category(name: 'Завтраки'),
    Category(name: 'Обеды'),
    Category(name: 'Выпечка'),
    Category(name: 'Десерты'),
    Category(name: 'Кофейное меню'),
    Category(name: 'Салаты'),
    Category(name: 'Супы'),
    Category(name: 'Горячее'),
    Category(name: 'Гарниры'),
  ];

  // Текущая активная категория
  String? _activeCategory;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 20),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: categories.map((category) {
            return CategoryButton(
              name: category.name,
              isActive: _activeCategory == category.name,
              onTap: () {
                setState(() {
                  _activeCategory = category.name; // Меняем активную категорию
                });
              },
            );
          }).toList(),
        ),
      ),
    );
  }
}

class CategoryButton extends StatelessWidget {
  final String name;
  final bool isActive;
  final VoidCallback onTap;

  const CategoryButton({
    super.key,
    required this.name,
    required this.isActive,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        TextButton(
          onPressed: onTap, // Вызываем функцию при нажатии
          child: Text(
            name,
            style: TextStyle(
              color: isActive ? AppColors.richPurplishRedColor : Colors.black, // Меняем цвет, если категория активна
              fontSize: 16,
              fontWeight: isActive ? FontWeight.bold : FontWeight.normal, // Дополнительно можно менять стиль текста
            ),
          ),
        ),
        const SizedBox(width: 25)
      ],
    );
  }
}

class Category {
  final String name;

  const Category({required this.name});
}
