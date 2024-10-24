import 'package:flutter/material.dart';
import 'package:sloykabakery/navigation.dart';
import 'package:sloykabakery/screens/main_screen/main_screen.dart';
import 'package:sloykabakery/screens/menu_screen/breakfast_screen.dart';
import 'package:sloykabakery/themes/app_colors.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
        bottomNavigationBarTheme: const BottomNavigationBarThemeData(
          // backgroundColor: AppColors.one,
          unselectedItemColor: Colors.black,
          selectedItemColor: AppColors.one,
          
        )
      ),
      home: const Navigation(),
    );
  }
}


