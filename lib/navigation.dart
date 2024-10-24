import 'package:flutter/material.dart';
import 'package:sloykabakery/screens/addresses_screen/addresses_screen.dart';
import 'package:sloykabakery/screens/corporate_meals_screen/corporate_meals_screen.dart';
import 'package:sloykabakery/screens/main_screen/main_screen.dart';
import 'package:sloykabakery/screens/menu_screen/menu_screen.dart';

class Navigation extends StatefulWidget {
  const Navigation({super.key});

  @override
  State<Navigation> createState() => _NavigationState();
}

class _NavigationState extends State<Navigation> {
  int _selectedTab = 0;

  static final List<Widget> _widgetOptions = <Widget> [
    const MainScreen(),
    const MenuScreen(),
    const AddressesScreen(),
    const CorporateMealsScreen(),
  ];

  void onSelectTab(int index) {
    if (_selectedTab == index) return;
    setState(() {
      _selectedTab = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold( 
      body: 
      _widgetOptions[_selectedTab],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: _selectedTab,
         items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Главная',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.restaurant),
            label: 'Меню',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.map),
            label: 'Адреса',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.lunch_dining),
            label: 'Корпоративное питание',
          ),
        ],
        onTap: onSelectTab,
      ),
    );
  }
}