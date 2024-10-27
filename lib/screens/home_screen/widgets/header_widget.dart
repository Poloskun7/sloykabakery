import 'package:flutter/material.dart';
import 'package:sloykabakery/themes/app_theme.dart';

class HeaderWidget extends StatelessWidget {
  const HeaderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
        children: [
          Text('Ресторан', style: AppTextStyles.heading_1),
          Text('для деловых будней', style: AppTextStyles.heading_1),
          Text('в Санкт‑Петербурге', style: AppTextStyles.heading_1)
        ],
      );
    
  }
}