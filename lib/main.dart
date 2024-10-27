import 'package:flutter/material.dart';
// import 'package:yandex_maps_navikit/yandex_map.dart' as init;
import 'package:sloykabakery/navigation.dart';
import 'package:sloykabakery/screens/home_screen/thank_you_screen.dart';
import 'package:sloykabakery/screens/home_screen/feedback_screen.dart';
import 'package:sloykabakery/themes/app_theme.dart';

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
          // backgroundColor: AppColors.whiteColor,
          selectedItemColor: AppColors.richPurplishRedColor,
          unselectedItemColor: AppColors.blackColor,
          
        )
      ),
      routes: {
        '/': (context) => const Navigation(),
        '/feedback': (context) => const FeedbackScreen(),
        '/thank_you': (context) => const ThankYouScreen(),
      },
    );
  }
}


