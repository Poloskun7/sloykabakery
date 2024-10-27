import 'package:flutter/material.dart';
import 'package:sloykabakery/screens/home_screen/widgets/button_widget.dart';
import 'package:sloykabakery/themes/app_theme.dart';

class ThankYouScreen extends StatelessWidget {
  const ThankYouScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
          Text('Спасибо!', style: AppTextStyles.heading_3),
          SizedBox(height: 20),
          Text('Ваша заявка отправлена', style: AppTextStyles.heading_3),
          SizedBox(height: 20),
          ButtonWidget(buttonText: 'Вернуться')
        ]),
      ),
    );
  }
}
