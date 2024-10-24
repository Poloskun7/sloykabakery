import 'package:flutter/material.dart';
import 'package:sloykabakery/screens/menu_screen/widgets/product_widget.dart';
import 'package:sloykabakery/screens/menu_screen/widgets/screen_name_widget.dart';

class BakeryScreen extends StatelessWidget {
    final List<ProductWidget> productWidgets = const [
    ProductWidget(name: 'Слойка с шоколадом', price: '95 руб.'),
    ProductWidget(name: 'Слойка с курицей и грибами', price: '97 руб.'),
    ProductWidget(name: 'Слойка с корицей', price: '73 руб.'),
    ProductWidget(name: 'Слойка с вареной сгущенкой', price: '89 руб.'),
    ProductWidget(name: 'Слойка с бананом и шоколадом', price: '89 руб.'),
    ProductWidget(name: 'Киш с курицей и сыром', price: '113 руб.'),
    ProductWidget(name: 'Булочка творожная', price: '85 руб.'),
    ProductWidget(name: 'Булочка с маком', price: '85 руб.'),
    ProductWidget(name: 'Булочка "Сладкое сердце"', price: '59 руб.'),
    ProductWidget(name: 'Слойка с яблоком', price: '85 руб.'),
    ProductWidget(name: 'Улитка с маком', price: '73 руб.'),
    ProductWidget(name: 'Штрейзель', price: '73 руб.'),
    ProductWidget(name: 'Вензель с заварным кремом', price: '113 руб.'),
    ProductWidget(name: 'Вензель с малиной', price: '113 руб.'),
    ProductWidget(name: 'Везель с вишней', price: '95 руб.'),
    
  ];

  const BakeryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Column(
        children: [
          const ScreenNameWidget(name: 'Выпечка'),
          Column(
            children: productWidgets,
          ),
        ],
      ),
    );
  }
}