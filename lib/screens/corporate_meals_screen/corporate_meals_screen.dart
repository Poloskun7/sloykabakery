import 'package:flutter/material.dart';
import 'package:sloykabakery/custom_sliver_app_bar.dart';
import 'package:sloykabakery/screens/corporate_meals_screen/widgets/header_widget.dart';
import 'package:sloykabakery/screens/corporate_meals_screen/widgets/thinking_about_name.dart';
import 'package:sloykabakery/screens/home_screen/widgets/button_widget.dart';
import 'package:sloykabakery/screens/home_screen/widgets/info_widget.dart';

class CorporateMealsScreen extends StatelessWidget {
  const CorporateMealsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const CustomSliverAppBar(widgets: [CorporateMealsWidgets()]);
  }
}

class CorporateMealsWidgets extends StatelessWidget {
  const CorporateMealsWidgets({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 20),
      child: Column(
        children: [
          HeaderWidget(),
          SizedBox(height: 20),
          ThinkingAboutName(
            heading: 'Организация питания для туристических групп',
            comment:
                'Поможем подобрать оптимальный вариант для размещения любой группы, исходя из ваших пожеланий и туристического маршрута.',
          ),
          SizedBox(height: 20),
          Image(image: NetworkImage('https://sloykabakery.ru/templates/sloyka/img/corporate-item2.webp')),
          SizedBox(height: 20),
          ThinkingAboutName(
              heading:
                  'Проведение фуршетов, банкетов, корпоративов, кофе-брейков и выпускных',
              comment:
                  'Проводим мероприятия любой сложности. Предоставляем просторный зал, обслуживание на&nbsp;протяжении всего вечера, меню на&nbsp;ваш вкус.'),
          SizedBox(height: 20),
          Image(image: NetworkImage('https://sloykabakery.ru/templates/sloyka/img/corporate-item1.webp')),
          SizedBox(height: 20),
          InfoWidget(),
          SizedBox(height: 20),
          ButtonWidget(
            buttonText: 'Обратная связь',
            nextScreen: 'feedback',
          ),
          SizedBox(height: 20),
        ],
      ),
    );
  }
}
