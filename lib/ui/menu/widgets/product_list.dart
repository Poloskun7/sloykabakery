import 'package:flutter/material.dart';
import 'package:sloykabakery/domain/models/product.dart';
import 'package:sloykabakery/ui/menu/widgets/product_item.dart';

class ProductList extends StatelessWidget {
  final List<Product> products;
  
  const ProductList({super.key, required this.products});
  
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
          scrollDirection: Axis.vertical,
          padding: const EdgeInsets.symmetric(vertical: 8),
          child: Column(
            children: [
              // const SizedBox(width: 16),
              ...products.map(
                (product) => ProductItem(product: product),
              ),
              // const SizedBox(width: 16),
            ],
          ),
        );
  }
}