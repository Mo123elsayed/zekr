import 'package:flutter/material.dart';
import 'package:zekr/view/ui/screens/favorites_screen.dart';
import 'package:zekr/view/ui/screens/home_screen.dart';
import 'package:zekr/view/ui/screens/search_screen.dart';
import 'package:zekr/view/ui/screens/settings_screen.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({super.key});

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  final List<Map<String, dynamic>> _screens = [
    // Add your screens here
    {'screen': const HomeScreen(), 'label': 'Home', 'icon': Icons.home},
    {
      'screen': const FavoritesScreen(), // Replace with your actual screen
      'label': 'Favorites',
      'icon': Icons.search,
    },
    {
      'screen': const SearchScreen(), // Replace with your actual screen
      'label': 'Search',
      'icon': Icons.person,
    },
    {
      'screen': const SettingsScreen(), // Replace with your actual screen
      'label': 'Settings',
      'icon': Icons.person,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_selectedIndex]['screen'],
      bottomNavigationBar: Container(
        margin: const EdgeInsets.only(bottom: 15, left: 10, right: 10),
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black26,
              blurRadius: 20,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(30),
          child: BottomNavigationBar(
            elevation: 0,
            type: BottomNavigationBarType.values.first,
            currentIndex: _selectedIndex,
            onTap: _onItemTapped,
            items: _screens
                .map(
                  (screen) => BottomNavigationBarItem(
                    icon: Icon(screen['icon']),
                    label: screen['label'],
                  ),
                )
                .toList(),
          ),
        ),
      ),
    );
  }
}
