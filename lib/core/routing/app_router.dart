import 'package:flutter/material.dart';
import 'package:zekr/core/routing/routes.dart';
import 'package:zekr/view/ui/screens/details_screen.dart';
import 'package:zekr/view/ui/screens/favorites_screen.dart';
import 'package:zekr/view/ui/screens/home_screen.dart';
import 'package:zekr/view/ui/screens/onboarding_screen.dart';
import 'package:zekr/view/ui/screens/search_screen.dart';
import 'package:zekr/view/ui/screens/splash_screen.dart';
import 'package:zekr/view/ui/widgets/bottom_nav_bar.dart';

class AppRouter {

  Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.home:
        return MaterialPageRoute(
          builder: (_) => const BottomNavBar(),
          settings: settings,
        );
      case Routes.details: 
        return MaterialPageRoute(builder: (_) => const DetailsScreen());
      case Routes.favorites:
        return MaterialPageRoute(builder: (_) => const FavoritesScreen());
      case Routes.onBoarding:
        return MaterialPageRoute(builder: (_) => const OnBoardingScreen());
      case Routes.search:
        return MaterialPageRoute(builder: (_) => const SearchScreen());
      case Routes.splash:
        return MaterialPageRoute(builder: (_) => const SplashScreen());
      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(child: Text('No route defined for ${settings.name}')),
          ),
        );
    }
  }
}
