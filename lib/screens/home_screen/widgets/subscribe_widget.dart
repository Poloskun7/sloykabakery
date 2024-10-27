import 'package:flutter/material.dart';
import 'package:sloykabakery/themes/app_theme.dart';

class SubscribeWidget extends StatelessWidget {
  const SubscribeWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Column(
        children: [
          Text('Не пропустите', style: AppTextStyles.comment),
          Text('всё самое интересное', style: AppTextStyles.comment),
          SizedBox(height: 20),
          Text('Подписывайтесь на нас', style: AppTextStyles.heading_2),
          Text('в социальных сетях -', style: AppTextStyles.heading_2),
          Text('sloykabakery', style: AppTextStyles.heading_2)
        ],
      ),
    );
  }
}