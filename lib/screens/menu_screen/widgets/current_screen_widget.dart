import 'package:flutter/material.dart';

class CurrentScreenWidget extends StatelessWidget {
  final String text;

  const CurrentScreenWidget({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 20),
      child: Row(
        children: [
          Text('Главная / $text'),
          const Text(' / ')
        ],),
    );
  }
}