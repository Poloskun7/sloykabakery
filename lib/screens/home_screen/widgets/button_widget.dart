import 'package:flutter/material.dart';
import 'package:sloykabakery/themes/app_themes.dart';

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
                ? Navigator.pushNamed(context, '/$nextScreen')
                : nextScreen == 'thank_you'
                    ? Navigator.pushReplacementNamed(context, '/$nextScreen')
                    : Navigator.pop(context);
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
