import 'package:flutter/material.dart';

class MenuWidget extends StatelessWidget {
  const MenuWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Меню', style: TextStyle(fontSize: 16)),
          SizedBox(height: 10),
          Text('Адреса', style: TextStyle(fontSize: 16)),
          SizedBox(height: 10),
          Text('Корпоративное питание', style: TextStyle(fontSize: 16))
        ],
      ),
    );
  }
}