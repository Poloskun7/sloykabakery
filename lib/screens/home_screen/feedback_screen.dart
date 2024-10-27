import 'package:flutter/material.dart';
import 'package:sloykabakery/screens/home_screen/widgets/button_widget.dart';
import 'package:sloykabakery/themes/app_theme.dart';

class FeedbackScreen extends StatelessWidget {
  const FeedbackScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 50),
        child: Column(
          children: [
            Align(
                alignment: Alignment.bottomRight,
                child: IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: const Icon(Icons.arrow_back))),
            const Text(
              'Оставить заявку',
              style: AppTextStyles.heading_3,
            ),
            const SizedBox(height: 20),
            const TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Ваше имя',
              ),
            ),
            const SizedBox(height: 20),
            const TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Ваш телефон',
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              'Нажимая на кнопку «Отправить», вы соглашаетесь на обработку персональных данных',
              style: AppTextStyles.comment,
            ),
            const SizedBox(height: 20),
            const ButtonWidget(
              buttonText: 'Отправить',
              nextScreen: 'thank_you',
            ),
          ],
        ),
      ),
    );
  }
}
