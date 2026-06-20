import 'package:flutter/material.dart';
import 'package:zekr/core/routing/routes.dart';
import 'package:zekr/view/ui/screens/home_screen.dart';

class AppRouter {
  Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.home:
        return MaterialPageRoute(
          builder: (_) => const HomeScreen(),
          settings: settings,
        );
      // case '/details':
      //   return MaterialPageRoute(builder: (_) => const DetailsScreen());
      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(child: Text('No route defined for ${settings.name}')),
          ),
        );
    }
  }
}
