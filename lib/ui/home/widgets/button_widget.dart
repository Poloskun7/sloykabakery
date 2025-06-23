import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sloykabakery/ui/core/themes/colors.dart';
import 'package:sloykabakery/ui/core/themes/theme.dart';

class ButtonWidget extends StatelessWidget {
  final String buttonText;
  final String? nextScreen;

  const ButtonWidget({super.key, required this.buttonText, this.nextScreen});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
          onPressed: () {
            nextScreen != null && nextScreen != 'thank_you'
                ? context.go('/$nextScreen')
                : nextScreen == 'thank_you'
                    ? context.go('/$nextScreen')
                    :context.go('/');
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: AppColors.richPurplishRedColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
          ),
          child: Text(buttonText, style: AppTextStyles.button)),
    );
  }
}
