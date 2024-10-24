import 'package:flutter/material.dart';

class SubscribeWidget extends StatelessWidget {
  const SubscribeWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Column(
        children: [
          Text('Не пропустите', style: TextStyle(color: Colors.grey, fontSize: 14)),
          Text('всё самое интересное', style: TextStyle(color: Colors.grey, fontSize: 14)),
          SizedBox(height: 20),
          Text('Подписывайтесь на нас', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
          Text('в социальных сетях -', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
          Text('sloykabakery', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold))
        ],
      ),
    );
  }
}