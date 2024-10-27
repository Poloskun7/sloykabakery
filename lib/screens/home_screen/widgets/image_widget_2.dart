import 'package:flutter/material.dart';

class ImageWidget2 extends StatelessWidget {
  const ImageWidget2({super.key});

  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          Image(image: NetworkImage('https://sloykabakery.ru/templates/sloyka/img/instagram-item1.webp?111'), width: 213.7, height: 213.7),
          SizedBox(width: 10),
          Image(image: NetworkImage('https://sloykabakery.ru/templates/sloyka/img/instagram-item2.webp?111'), width: 213.7, height: 213.7),
          SizedBox(width: 10),
          Image(image: NetworkImage('https://sloykabakery.ru/templates/sloyka/img/instagram-item3.webp?111'), width: 213.7, height: 213.7),
          SizedBox(width: 10),
          Image(image: NetworkImage('https://sloykabakery.ru/templates/sloyka/img/instagram-item4.webp?111'), width: 213.7, height: 213.7),
          SizedBox(width: 10),
          Image(image: NetworkImage('https://sloykabakery.ru/templates/sloyka/img/instagram-item5.webp?111'), width: 213.7, height: 213.7),
          SizedBox(width: 10),
          Image(image: NetworkImage('https://sloykabakery.ru/templates/sloyka/img/instagram-item6.webp?111'), width: 213.7, height: 213.7),
          SizedBox(width: 10),
          Image(image: NetworkImage('https://sloykabakery.ru/templates/sloyka/img/instagram-item7.webp?111'), width: 213.7, height: 213.7),
          SizedBox(width: 10),
          Image(image: NetworkImage('https://sloykabakery.ru/templates/sloyka/img/instagram-item8.webp?111'), width: 213.7, height: 213.7),
          SizedBox(width: 10),
          Image(image: NetworkImage('https://sloykabakery.ru/templates/sloyka/img/instagram-item9.webp?111'), width: 213.7, height: 213.7),
          SizedBox(width: 10),
          Image(image: NetworkImage('https://sloykabakery.ru/templates/sloyka/img/instagram-item10.webp?111'), width: 213.7, height: 213.7),
        ],
      ),
    );
  }
}