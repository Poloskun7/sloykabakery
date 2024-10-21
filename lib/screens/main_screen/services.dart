import 'package:flutter/material.dart';

class Services extends StatelessWidget {
  const Services({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 20),
      child: RichText(
        text: const TextSpan(
          style: TextStyle(fontSize: 14, color: Colors.black),
          children: [
            TextSpan(text: '• Проводим мероприятия любой сложности: предоставляем просторный зал, обслуживание на протяжении всего вечера, меню на ваш вкус\n'),
            TextSpan(text: '• Сформируем индивидуальный пакет услуг, включающий в себя гибкие решения, который будет соответствовать вашим предпочтениям и бюджету\n'),
            TextSpan(text: '• 14 филиалов по городу\n'),
          ]
        )),
    );
  }
}