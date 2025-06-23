import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sloykabakery/ui/home/widgets/home_screen.dart';
import 'package:sloykabakery/ui/menu/widgets/menu_screen.dart';
import 'package:sloykabakery/ui/addresses/widgets/addresses_screen.dart';
import 'package:sloykabakery/ui/corporate_meals/widgets/corporate_meals_screen.dart';

class Navigation extends StatefulWidget {
  final int initialIndex;

  const Navigation({super.key, required this.initialIndex});

  @override
  State<Navigation> createState() => _NavigationState();
}

class _NavigationState extends State<Navigation> {
  late int _selectedTab;

  static final List<Widget> _widgetOptions = <Widget>[
    // const HomeScreen(),
    const MenuScreen(),
    const MenuScreen(),
    AddressesScreen(),
    const CorporateMealsScreen(),
  ];

  @override
  void initState() {
    super.initState();
    _selectedTab = widget.initialIndex;
  }

  void onSelectTab(int index) {
    if (_selectedTab == index) return;
    setState(() {
      _selectedTab = index;
    });
    context.go(index == 0 ? '/' : index == 1 ? '/menu' : index == 2 ? '/addresses' : '/corporate_meals');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _widgetOptions[_selectedTab],
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
            label: 'Кейтеринг',
          ),
        ],
        onTap: onSelectTab,
      ),
    );
  }
}