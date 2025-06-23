import 'package:flutter/material.dart';
import 'package:sloykabakery/domain/models/product.dart';
import 'package:sloykabakery/ui/core/themes/colors.dart';

class ProductItem extends StatelessWidget {
  final Product product;

  const ProductItem(
      {super.key,
      required this.product,});

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
                  product.name,
                  style: const TextStyle(
                      fontSize: 16, fontWeight: FontWeight.bold),
                  softWrap: true,
                  overflow: TextOverflow.visible,
                ),
              ),
              Text(
                '${product.price} руб',
                style:
                    const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ],
          ),
          if (product.description != '')
            Padding(
                padding: const EdgeInsets.only(top: 8),
                child: Align(
                    alignment: Alignment.centerLeft, child: Text(product.description))),
          const SizedBox(height: 10),
          const Divider(color: AppColors.dividerColor)
        ],
      ),
    );
  }
}
