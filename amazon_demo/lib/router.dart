import 'package:flutter/material.dart';
import 'package:amazon_demo/features/auth/screens/auth_screen.dart';
import 'package:amazon_demo/features/home/screens/home_screen.dart';

Route<dynamic> generateRouter(RouteSettings routeSettings) {
  switch (routeSettings.name) {
    case AuthScreen.routeName:
      return MaterialPageRoute(
          settings: routeSettings, builder: (_) => const AuthScreen());
    case HomeScreen.routeName:
      return MaterialPageRoute(
          settings: routeSettings, builder: (_) => const HomeScreen());
    default:
      return MaterialPageRoute(
          builder: (_) => const Scaffold(
                body: Center(
                  child: Text("404  Error"),
                ),
              ));
  }
}
