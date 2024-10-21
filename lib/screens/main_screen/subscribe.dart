import 'package:flutter/material.dart';

class Subscribe extends StatelessWidget {
  const Subscribe({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Column(
        children: [
          Text('Не пропустите', style: TextStyle(fontSize: 14, color: Colors.grey)),
          Text('всё самое интересное', style: TextStyle(fontSize: 14, color: Colors.grey)),
          SizedBox(height: 20),
          Text('Подписывайтесь на нас', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
          Text('в социальных сетях -', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
          Text('sloykabakery', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold))
        ],
      ),
    );
  }
}