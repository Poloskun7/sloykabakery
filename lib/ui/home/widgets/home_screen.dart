import 'package:flutter/material.dart';
import 'package:sloykabakery/ui/core/ui/custom_sliver_app_bar.dart';
import 'package:sloykabakery/ui/home/widgets/button_widget.dart';
import 'package:sloykabakery/ui/home/widgets/carousel_slider_widget.dart';
import 'package:sloykabakery/ui/home/widgets/header_widget.dart';
import 'package:sloykabakery/ui/home/widgets/image_widget_2.dart';
import 'package:sloykabakery/ui/core/ui/info_widget.dart';
import 'package:sloykabakery/ui/home/widgets/services_widget.dart';
import 'package:sloykabakery/ui/home/widgets/subscribe_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const CustomSliverAppBar(widgets: [HomeWidgets()]);
  }
}

class HomeWidgets extends StatelessWidget {
  const HomeWidgets({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 20),
      child: Column(
        children: [
          HeaderWidget(),
          SizedBox(height: 20),
          ServicesWidget(),
          SizedBox(height: 20),
          ButtonWidget(
            buttonText: 'Заказать банкет',
            nextScreen: 'feedback',
          ),
          SizedBox(height: 20),
          CarouselSliderWidget(),
          SizedBox(height: 20),
          SizedBox(height: 20),
          SubscribeWidget(),
          SizedBox(height: 20),
          ImageWidget2(),
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
