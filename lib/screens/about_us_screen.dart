import 'package:flutter/material.dart';
import 'package:sloykabakery/themes/app_colors.dart';

class AboutUsScreen extends StatelessWidget {
  const AboutUsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('СЛОЙКА', style: TextStyle(fontSize: 24, color: AppColors.one, fontWeight: FontWeight.bold)),
      ),
      body: ListView(children: [
      const Center(child: Text('Ресторан для деловых будней в Санкт‑Петербурге', style: TextStyle(fontSize: 18))),
      const Text('Проводим мероприятия любой сложности: предоставляем просторный зал, обслуживание на протяжении всего вечера, меню на ваш вкус'),
      const Text('Сформируем индивидуальный пакет услуг, включающий в себя гибкие решения, который будет соответствовать вашим предпочтениям и бюджету'),
      const Text('14 филиалов по городу'),
      
      FloatingActionButton(onPressed: (){}, backgroundColor: AppColors.one, child: const Text('Заказать банкет', style: TextStyle(color: Colors.white))),
      const Center(child: Text('Не пропустите всё самое интересное', style: TextStyle(color: Colors.grey,))),
      const Center(child: Text('Подписывайтесь на нас в социальных сетях - sloykabakery', style: TextStyle(fontSize: 18))),
    ],),);
  }
}