import 'package:flutter/material.dart';

class InfoWidget extends StatelessWidget {

  const InfoWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          MarketingContactWidget(),
          SizedBox(height: 20),
          Divider(),
          SizedBox(height: 20),
          ArendaContactWidget()
        ]
      ),
    );
  }
}

class MarketingContactWidget extends StatelessWidget {
  const MarketingContactWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('+7(921)440-25-05', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
        Text('пн-пт: 08:30 – 18:00', style: TextStyle(color: Colors.grey, fontSize: 12)),
        SizedBox(height: 20),
        Text('marketing@sloykabakery.ru', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
        Text('по любым вопросам', style: TextStyle(color: Colors.grey, fontSize: 12))
      ],
    );
  }
}

class ArendaContactWidget extends StatelessWidget {
  const ArendaContactWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('+7(812)332-93-63', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
        Text('пн-пт: 08:30 – 18:00', style: TextStyle(color: Colors.grey, fontSize: 12)),
        SizedBox(height: 20),
        Text('arenda@sloykabakery.ru', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
        Text('предложить помещение', style: TextStyle(color: Colors.grey, fontSize: 12))
      ],
    );
  }
}