import 'package:flutter/material.dart';
import 'package:sloykabakery/ui/core/themes/theme.dart';

class HeaderWidget extends StatelessWidget {
  const HeaderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        Text(
          'Корпоративное',
          style: AppTextStyles.heading_1,
        ),
        Text(
          'питание',
          style: AppTextStyles.heading_1,
        )
      ],
    );
  }
}
