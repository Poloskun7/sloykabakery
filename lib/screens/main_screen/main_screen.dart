import 'package:flutter/material.dart';
import 'package:sloykabakery/screens/main_screen/banquet.dart';
import 'package:sloykabakery/screens/main_screen/heading.dart';
import 'package:sloykabakery/screens/main_screen/services.dart';
import 'package:sloykabakery/screens/main_screen/subscribe.dart';
import 'package:sloykabakery/themes/app_colors.dart';

class AboutUsScreen extends StatelessWidget {
  const AboutUsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('СЛОЙКА', style: TextStyle(fontSize: 30, color: AppColors.one, fontWeight: FontWeight.bold)),
      ),
      body: ListView(children: const [
      Heading(),
      Services(),
      Banquet(),
      Subscribe(),
    ],),);
  }
}