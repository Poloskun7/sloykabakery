import 'package:flutter/material.dart';
import 'package:sloykabakery/themes/app_theme.dart';

class ServicesWidget extends StatelessWidget {
  const ServicesWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return RichText(
        text: const TextSpan(style: AppTextStyles.standart_1, children: [
      TextSpan(
          text:
              '• Проводим мероприятия любой сложности: предоставляем просторный зал, обслуживание на протяжении всего вечера, меню на ваш вкус\n'),
      TextSpan(
          text:
              '• Сформируем индивидуальный пакет услуг, включающий в себя гибкие решения, который будет соответствовать вашим предпочтениям и бюджету\n'),
      TextSpan(text: '• 14 филиалов по городу\n'),
    ]));
  }
}
