import 'package:delivery_app/models/product_model.dart';
import 'package:delivery_app/root.dart';
import 'package:delivery_app/utils/router/app_routes.dart';
import 'package:delivery_app/view_models/productDetails/product_details_cubit.dart';
import 'package:delivery_app/views/pages/product_details_page.dart';
import 'package:delivery_app/views/pages/search_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppRouter {
  static Route<dynamic>? Function(RouteSettings settings)? onGenerateRoute() {
    return (RouteSettings settings) {
      switch (settings.name) {
        case AppRoutes.searchPageRoute:
          return MaterialPageRoute(
            builder: (_) => const SearchPage(),
            settings: settings,
          );
        case AppRoutes.itemDetailsPage:
          final product = settings.arguments as ProductModel;
          return MaterialPageRoute(
            builder: (_) => BlocProvider(
              create: (context) => ProductDetailsCubit(),
              child: ProductDetailsPage(product: product),
            ),
            settings: settings,
          );

        case AppRoutes.root:
        default:
          return MaterialPageRoute(builder: (_) => Root(), settings: settings);
      }
    };
  }
}
