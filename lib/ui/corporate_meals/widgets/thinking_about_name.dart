import 'package:flutter/material.dart';
import 'package:sloykabakery/ui/core/themes/colors.dart';
import 'package:sloykabakery/ui/core/themes/theme.dart';

class ThinkingAboutName extends StatelessWidget {
  final String heading;
  final String comment;

  const ThinkingAboutName({super.key, required this.heading, required this.comment});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
      color: AppColors.containerColor,
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(heading, style: AppTextStyles.heading_3),
          const SizedBox(height: 50),
          Text(comment, style: AppTextStyles.standart_2),
        ],
      ),
    );
  }
}
