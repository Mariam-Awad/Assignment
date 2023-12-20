import 'package:assignment/presentation/screens/popular_home_cubit/popular_people_screen.dart';
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
      default:
        return MaterialPageRoute(
          builder: (context) => const PopularHomeScreen(),
        );
    }
  }
}
