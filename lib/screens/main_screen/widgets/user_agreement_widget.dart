import 'package:flutter/material.dart';

class UserAgreementWidget extends StatelessWidget {
  const UserAgreementWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.only(left: 16, right: 16, bottom: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Divider(),
          SizedBox(height: 10),
          Text('Пользовательское соглашение', style: TextStyle(color: Colors.grey, fontSize: 12)),
          Text('2024, Слойка. Сеть ресторанов в Санкт‑Петербурге', style: TextStyle(color: Colors.grey, fontSize: 12)),
          SizedBox(height: 20),
          Text('Разработка сайта СЕТЕВЫЕ РЕШЕНИЯ 2.0 ', style: TextStyle(color: Colors.grey, fontSize: 12)),
        ],
      ),
    );
  }
}