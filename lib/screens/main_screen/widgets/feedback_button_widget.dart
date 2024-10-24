import 'package:flutter/material.dart';
import 'package:sloykabakery/themes/app_colors.dart';

class FeedbackButtonWidget extends StatelessWidget {
  const FeedbackButtonWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
      child: FloatingActionButton(onPressed: (){}, backgroundColor: AppColors.one, child: const Text('Обратная связь', style: TextStyle(color: Colors.white))));
  }
}