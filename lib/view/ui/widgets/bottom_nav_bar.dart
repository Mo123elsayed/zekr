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
    {
      'screen': const HomeScreen(),
      'label': 'Home',
      'icon': Icons.home_max_rounded,
    },
    {
      'screen': const FavoritesScreen(), // Replace with your actual screen
      'label': 'Favorites',
      'icon': Icons.favorite_rounded,
    },
    {
      'screen': const SearchScreen(), // Replace with your actual screen
      'label': 'Search',
      'icon': Icons.search_rounded,
    },
    {
      'screen': const SettingsScreen(), // Replace with your actual screen
      'label': 'Settings',
      'icon': Icons.settings,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_selectedIndex]['screen'],
      bottomNavigationBar: Container(
        margin: const EdgeInsets.only(bottom: 15, left: 10, right: 10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: Colors.black26,
              blurRadius: 20,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: BottomNavigationBar(
            selectedItemColor: Colors.black,
            unselectedItemColor: Colors.grey,
            selectedLabelStyle: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
            unselectedLabelStyle: TextStyle(fontSize: 12, color: Colors.grey),
            elevation: 0,
            type: BottomNavigationBarType.shifting,
            currentIndex: _selectedIndex,
            onTap: _onItemTapped,
            items: _screens
                .map(
                  (screen) => BottomNavigationBarItem(
                    icon: Icon(screen['icon'], size: 10),
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
