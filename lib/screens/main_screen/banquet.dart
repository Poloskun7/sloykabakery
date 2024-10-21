import 'package:flutter/material.dart';
import 'package:sloykabakery/themes/app_colors.dart';

class Banquet extends StatelessWidget {
  const Banquet({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: FloatingActionButton(onPressed: (){}, backgroundColor: AppColors.one, child: const Text('Заказать банкет', style: TextStyle(color: Colors.white))));
  }
}