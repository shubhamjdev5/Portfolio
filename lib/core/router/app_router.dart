import 'package:flutter/material.dart';
import 'package:insureme/features/base/base_screen.dart';

class AppRouter {
  static const String base = '/';

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case base:
        return MaterialPageRoute(builder: (_) => const BaseScreen());
      default:
        return MaterialPageRoute(
          builder: (_) =>
              const Scaffold(body: Center(child: Text('404 Page Not Found'))),
        );
    }
  }
}
