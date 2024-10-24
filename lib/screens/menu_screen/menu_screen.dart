import 'package:flutter/material.dart';
import 'package:sloykabakery/custom_sliver_app_bar.dart';
import 'package:sloykabakery/screens/menu_screen/bakery_screen.dart';
import 'package:sloykabakery/screens/menu_screen/breakfast_screen.dart';
import 'package:sloykabakery/screens/menu_screen/lunch_screen.dart';
import 'package:sloykabakery/screens/menu_screen/widgets/categories.dart';
import 'package:sloykabakery/screens/menu_screen/widgets/current_screen_widget.dart';
import 'package:sloykabakery/screens/menu_screen/widgets/screen_name_widget.dart';

class MenuScreen extends StatelessWidget {
  final List<Widget> widgets = const [
    CurrentScreenWidget(text: 'Меню',),
    ScreenNameWidget(name: 'Меню'),
    Categories(),
    BreakfastScreen(),
    LunchScreen(),
    BakeryScreen(),
  ];

  const MenuScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomSliverAppBar(widgets: widgets);
  }
}
