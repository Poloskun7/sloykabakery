import 'package:flutter/material.dart';
import 'package:sloykabakery/screens/menu_screen/widgets/product_widget.dart';
import 'package:sloykabakery/screens/menu_screen/widgets/screen_name_widget.dart';

class LunchScreen extends StatelessWidget {
  final List<ProductWidget> productWidgets = const [
    ProductWidget(
        name: 'Сытный',
        description: 'Салат, горячее блюдо, гарнир, напиток, суп, пирожок',
        price: '419 руб.'),
    ProductWidget(
        name: 'Разнообразный',
        description: 'Салат, горячее блюдо, гарнир, напиток, суп',
        price: '399 руб.'),
    ProductWidget(
        name: 'Традиционный',
        description: 'Салат, горячее блюдо, гарнир, напиток',
        price: '349 руб.'),
  ];

  const LunchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Column(
        children: [
          const ScreenNameWidget(name: 'Обеды'),
          Column(
            children: productWidgets,
          ),
        ],
      ),
    );
  }
}
