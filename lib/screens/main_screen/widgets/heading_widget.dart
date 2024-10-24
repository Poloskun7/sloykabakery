import 'package:flutter/material.dart';

class HeadingWidget extends StatelessWidget {
  const HeadingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Column(
        children: [
          SizedBox(height: 20),
          Text('Ресторан', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
          Text('для деловых будней', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
          Text('в Санкт‑Петербурге', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold))
        ],
      ),
    );
  }
}