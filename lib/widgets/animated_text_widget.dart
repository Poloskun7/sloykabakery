import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:sloykabakery/themes/app_themes.dart';

class AnimatedTextWidget extends StatelessWidget {
  final String text;

  const AnimatedTextWidget({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: AppTextStyles.standart_1,
    )
        .animate(onPlay: (controller) => controller.repeat())
        .fadeIn()
        .tint(color: AppColors.richPurplishRedColor, duration: 3.seconds)
        .then(delay: 2.seconds)
        .fadeOut();
  }
}
