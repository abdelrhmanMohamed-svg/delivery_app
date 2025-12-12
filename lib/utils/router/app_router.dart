import 'package:delivery_app/models/product_model.dart';
import 'package:delivery_app/root.dart';
import 'package:delivery_app/utils/router/app_routes.dart';
import 'package:delivery_app/views/pages/product_details_page.dart';
import 'package:flutter/material.dart';

class AppRouter {
  static Route<dynamic>? Function(RouteSettings settings)? onGenerateRoute() {
    return (RouteSettings settings) {
      switch (settings.name) {
        case AppRoutes.itemDetailsPage:
          final product = settings.arguments as ProductModel;
          return MaterialPageRoute(
            builder: (_) => ProductDetailsPage(product: product),
            settings: settings,
          );

        case AppRoutes.root:
        default:
          return MaterialPageRoute(builder: (_) => Root(), settings: settings);
      }
    };
  }
}
