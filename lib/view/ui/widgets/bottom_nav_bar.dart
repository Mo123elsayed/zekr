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

/// This widget represents a bottom navigation bar with multiple screens. It allows users to switch between different screens by tapping on the corresponding navigation items. The selected screen is displayed in the body of the Scaffold, and the navigation bar is styled with rounded corners and shadows for a modern look.
/// The navigation bar contains four items: Home, Favorites, Search, and Settings. Each item is associated with a specific screen, and tapping on an item updates the selected index and displays the corresponding screen. The navigation bar also provides visual feedback for the selected item by changing its color and label style.
/// The BottomNavBar widget is implemented as a StatefulWidget to manage the selected index state. It uses a List of Maps to define the screens, labels, and icons for each navigation item. The build method constructs the Scaffold with the selected screen and the styled BottomNavigationBar.

class _BottomNavBarState extends State<BottomNavBar> {
  int _selectedIndex = 0;

  /// This method is called when a navigation item is tapped.
  /// It updates the selected index state and triggers a rebuild of the widget to display the corresponding screen.
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  /// This private list defines the screens, labels, and icons for each navigation item in the bottom navigation bar.
  /// Each entry in the list is a Map containing the screen widget, label text, and icon data.
  /// The screens are displayed based on the selected index, and the navigation items are generated dynamically from this list.
  /// The list currently includes four screens: HomeScreen, FavoritesScreen, SearchScreen, and SettingsScreen.
  /// Each screen is associated with a label and an icon that represents its functionality.
  /// You can add or remove screens by modifying this list as needed.
  /// The [_screens list] is used in the build method to construct the BottomNavigationBar items and to determine which screen to display in the body of the Scaffold based on the selected index.
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

  /// The build method constructs the UI for the BottomNavBar widget. It returns a Scaffold that contains the currently selected screen in its body and a styled BottomNavigationBar at the bottom. The BottomNavigationBar is wrapped in a Container with rounded corners and a shadow effect to enhance its appearance. The navigation items are generated dynamically from the _screens list, and tapping on an item updates the selected index and displays the corresponding screen.
  /// The BottomNavigationBar is configured with properties such as selected and unselected item colors, label styles, elevation, and type. The current index is set to the selected index, and the onTap callback is linked to the _onItemTapped method to handle user interactions. The navigation items are created using a map function that iterates over the _screens list and generates BottomNavigationBarItem widgets for each entry.
  /// Overall, the build method provides a responsive and visually appealing navigation experience for users, allowing them to switch between different screens seamlessly.
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
                    icon: Icon(screen['icon'], size: 25),
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
