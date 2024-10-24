import 'package:flutter/material.dart';
import 'package:sloykabakery/custom_sliver_app_bar.dart';
import 'package:sloykabakery/screens/addresses_screen/widgets/address_widget.dart';
import 'package:sloykabakery/screens/menu_screen/widgets/current_screen_widget.dart';
import 'package:sloykabakery/screens/menu_screen/widgets/screen_name_widget.dart';
import 'package:sloykabakery/screens/addresses_screen/widgets/map_widget.dart';

class AddressesScreen extends StatelessWidget {
  final List<Widget> widgets = const [
    CurrentScreenWidget(text: 'Адреса',),
    ScreenNameWidget(name: 'Наши рестораны'),
    AddressWidget(address: 'ул. Миллионная, 6', landmark: 'БЦ Сенатор', time: 'пн-пт 8:30 - 19:00'),
    AddressWidget(address: 'ул. Киевская, 5к5', landmark: 'БЦ Энерго', time: 'пн-пт 8:30 - 18:00'),
    AddressWidget(address: '18-я линия ВО, 29', landmark: 'БЦ Сенатор', time: 'пн-пт 8:30 - 18:00'),
    AddressWidget(address: 'Профессора Попова, 23', landmark: 'БЦ Гайот', time: 'пн-пт 8:30 - 18:00'),
    AddressWidget(address: 'ул. Марата 69-71', landmark: 'БЦ Ренессанс Плаза', time: 'пн-пт 8:30 - 19:00'),
    AddressWidget(address: 'ул. Красного Курсанта, 31', landmark: 'БЦ Керстен', time: 'пн-пт 8:30 - 19:00'),
    AddressWidget(address: 'ул. Кропоткина, 1А', landmark: 'БЦ Сенатор', time: 'пн-пт 8:30 - 19:00'),
    AddressWidget(address: 'ул. Чапаева, 15к2', landmark: 'БЦ Сенатор', time: 'пн-пт 8:30 - 19:00'),
    AddressWidget(address: 'Выборгская наб, 45Е', landmark: 'БЦ Стокгольм', time: 'пн-пт 8:30 - 19:00'),
    AddressWidget(address: 'Большой Сампсониевский пр, 68', landmark: 'БЦ Выборгская застава', time: 'пн-пт 8:30 - 19:00'),
    AddressWidget(address: 'ул. Академика Павлова, 5В', landmark: 'БЦ Ривер Хаус', time: 'пн-пт 8:30 - 18:00'),
    AddressWidget(address: 'Малоохтинский пр, 68', landmark: 'БЦ Регул', time: 'пн-пт 8:30 - 18:00'),
    AddressWidget(address: 'Московский пр, 60/129', landmark: 'БЦ Сенатор', time: 'пн-пт 8:30 - 18:00'),
    AddressWidget(address: 'Брантовская дорога, 3', landmark: 'Охта Молл, 3 этаж', time: 'каждый день 10:00 - 22:00'),
    AddressWidget(address: 'Выборгская наб, 45Е', landmark: 'EspressoBar 45', time: 'пн-пт 8:30 - 18:00'),
    Map(),
  ];

  const AddressesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomSliverAppBar(widgets: widgets);
  }
}