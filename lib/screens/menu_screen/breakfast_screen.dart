import 'package:flutter/material.dart';
import 'package:sloykabakery/screens/menu_screen/widgets/product_widget.dart';
import 'package:sloykabakery/screens/menu_screen/widgets/screen_name_widget.dart';

class BreakfastScreen extends StatelessWidget {
    final List<ProductWidget> productWidgets = const [
    ProductWidget(name: 'Завтрак Традиционный', price: '199 руб.'),
    ProductWidget(name: 'Завтрак Французский', price: '159 руб.'),
    ProductWidget(name: 'Завтрак Английский', price: '239 руб.'),
    ProductWidget(name: 'Шакшука и кофе', price: '300 руб.'),
    ProductWidget(name: 'Круассан с лососем', price: '259 руб.'),
    ProductWidget(name: 'Яйцо бенедикт с беконом', price: '177 руб.'),
    ProductWidget(name: 'Яичница', price: '199 руб.'),
    ProductWidget(name: 'Шакшука', price: '269 руб.'),
    ProductWidget(name: 'Скрембл классический', price: '199 руб.'),
    ProductWidget(name: 'Омлет', price: '199 руб.'),
    ProductWidget(name: 'Блины с персиками и сливочным кремом', price: '233 руб.'),
    ProductWidget(name: 'Каша на молоке', price: '145 руб.'),
    ProductWidget(name: 'Сырники', price: '159 руб.'),
  ];

  const BreakfastScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Column(
        children: [
          const ScreenNameWidget(name: 'Завтраки'),
          Column(
            children: productWidgets,
          ),
        ],
      ),
    );
  }
}