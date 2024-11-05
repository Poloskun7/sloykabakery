import 'package:flutter/material.dart';
import 'package:sloykabakery/screens/home_screen/widgets/button_widget.dart';
import 'package:sloykabakery/themes/app_themes.dart';

class FeedbackScreen extends StatelessWidget {
  const FeedbackScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BackgroundColorWidget(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 50),
          child: Column(
            children: [
              Align(
                  alignment: Alignment.bottomLeft,
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
              const TextFieldWidget(text: 'Ваше имя'),
              const SizedBox(height: 20),
              const TextFieldWidget(text: 'Ваш телефон'),
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
      ),
    );
  }
}

class TextFieldWidget extends StatelessWidget {
  final String text;
  const TextFieldWidget({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(
          color: AppColors.richPurplishRedColor,
        )),
        focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(
          color: AppColors.richPurplishRedColor,
        )),
        labelText: text,
        labelStyle: const TextStyle(color: AppColors.greyColor_1),
      ),
    );
  }
}
