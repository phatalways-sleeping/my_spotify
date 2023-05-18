import 'package:clone_spotify/screens/screens.dart';
import 'package:flutter/material.dart';

class RouteGenerator {
  static const String login = '/login';
  static const String home = '/mainscreen';

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case login:
        return MaterialPageRoute(builder: (context) => const LoginScreen());
      case home:
        return MaterialPageRoute(builder: (context) => const MainScreen());
      default:
        return MaterialPageRoute(builder: (context) => const LoginScreen());
    }
  }
}
