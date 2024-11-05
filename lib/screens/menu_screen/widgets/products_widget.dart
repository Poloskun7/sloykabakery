import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sloykabakery/screens/menu_screen/menu_screen.dart';
import 'package:sloykabakery/themes/app_themes.dart';

class ProductsWidget extends ConsumerWidget {
  const ProductsWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final products = ref.watch(productsProvider);
    final selectedCategoryId = ref.watch(selectedCategoryProvider);
    final filteredProducts = products.where((product) =>
              product.categoryId == selectedCategoryId);
    return SingleChildScrollView(
      child: Column(
        children: [
          ...filteredProducts,
        ],
      ),
    );
  }
}

class ProductWidget extends StatelessWidget {
  final int categoryId;
  final String name;
  final String description;
  final int price;

  const ProductWidget(
      {super.key,
      required this.categoryId,
      required this.name,
      required this.description,
      required this.price});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16, right: 16, top: 10),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Flexible(
                child: Text(
                  name,
                  style: const TextStyle(
                      fontSize: 16, fontWeight: FontWeight.bold),
                  softWrap: true,
                  overflow: TextOverflow.visible,
                ),
              ),
              Text(
                '$price руб',
                style:
                    const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ],
          ),
          if (description != '')
            Padding(
                padding: const EdgeInsets.only(top: 8),
                child: Align(
                    alignment: Alignment.centerLeft, child: Text(description))),
          const SizedBox(height: 10),
          const Divider(color: AppColors.dividerColor)
        ],
      ),
    );
  }
}
