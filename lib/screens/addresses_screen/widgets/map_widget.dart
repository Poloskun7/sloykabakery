import 'package:flutter/material.dart';

class Map extends StatelessWidget {
  const Map({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Padding(
          padding: EdgeInsets.only(top: 20),
          child: Text(
            'Ждем вас в гости',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ),
        Container(
          margin: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
          height: 300,
          color: Colors.green,
          child: const Center(
              child: Text(
            'Здесь будет карта',
            style: TextStyle(color: Colors.white),
          )),
        ),
      ],
    );
  }
}
