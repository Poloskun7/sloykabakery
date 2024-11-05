import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sloykabakery/widgets/navigation.dart';
import 'package:sloykabakery/screens/home_screen/thank_you_screen.dart';
import 'package:sloykabakery/screens/home_screen/feedback_screen.dart';
import 'package:sloykabakery/themes/app_themes.dart';

void main() {
  runApp(
    const ProviderScope(child: MyApp()),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: appTheme(),
      routes: {
        '/': (context) => const Navigation(),
        '/feedback': (context) => const FeedbackScreen(),
        '/thank_you': (context) => const ThankYouScreen(),
      },
    );
  }
}
