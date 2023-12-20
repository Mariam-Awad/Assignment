import 'package:assignment/screens/person_details/view/image_screen.dart';
import 'package:assignment/screens/person_details/view/person_details_screen.dart';
import 'package:assignment/screens/popular_home/view/popular_people_screen.dart';
import 'package:assignment/utils/app_debug_prints.dart';
import 'package:assignment/utils/app_routes.dart';
import 'package:flutter/material.dart';

class AppRouteManager {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final args = settings.arguments;
    printDone('arge $args');
    switch (settings.name) {
      case AppRoutes.homeRouteName:
        return MaterialPageRoute(
          builder: (context) => const PopularHomeScreen(),
        );
      case AppRoutes.personDetailsRouteName:
        return MaterialPageRoute(
          settings: RouteSettings(arguments: args),
          builder: (context) => PersonDetailsScreen(
            id: args as int,
          ),
        );
      case AppRoutes.imageRouteName:
        return MaterialPageRoute(
          settings: RouteSettings(arguments: args),
          builder: (context) => const ImageScreen(),
        );
      default:
        return MaterialPageRoute(
          builder: (context) => const PopularHomeScreen(),
        );
    }
  }
}
