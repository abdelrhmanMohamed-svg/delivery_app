import 'package:delivery_app/utils/app_constants.dart';
import 'package:delivery_app/utils/router/app_router.dart';
import 'package:delivery_app/utils/router/app_routes.dart';
import 'package:delivery_app/utils/theme/app_theme.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: AppConstants.appName,
      theme: AppTheme.getTheme,
      debugShowCheckedModeBanner: false,

      onGenerateRoute: AppRouter.onGenerateRoute(),
      initialRoute: AppRoutes.root,
    );
  }
}
