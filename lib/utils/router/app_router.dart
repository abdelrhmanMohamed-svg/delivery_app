import 'package:delivery_app/root.dart';
import 'package:delivery_app/utils/router/app_routes.dart';
import 'package:flutter/material.dart';

class AppRouter {
  static Route<dynamic>? Function(RouteSettings settings)? onGenerateRoute() {
    return (RouteSettings settings) {
      switch (settings.name) {
        case AppRoutes.root:
        default:
          return MaterialPageRoute(builder: (_) => Root(),settings: settings);
      }
    };
  }
}
