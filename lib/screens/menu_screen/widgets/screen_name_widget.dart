import 'package:flutter/material.dart';

class ScreenNameWidget extends StatelessWidget {
  final String name;

   const ScreenNameWidget({super.key, required this.name});

  @override
  Widget build(BuildContext context) {
    return Center(child: Text(name, style: const TextStyle(fontSize: 30, fontWeight: FontWeight.bold),));
  }
}