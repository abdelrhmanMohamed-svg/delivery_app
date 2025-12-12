import 'package:delivery_app/utils/app_constants.dart';
import 'package:delivery_app/utils/cubits/cubit/favorite_action_cubit.dart';
import 'package:delivery_app/utils/router/app_router.dart';
import 'package:delivery_app/utils/router/app_routes.dart';
import 'package:delivery_app/utils/theme/app_theme.dart';
import 'package:delivery_app/view_models/root/root_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => RootCubit()),
        BlocProvider(create: (context) => FavoriteActionCubit()),
      ],
      child: MaterialApp(
        title: AppConstants.appName,
        theme: AppTheme.getTheme,
        debugShowCheckedModeBanner: false,

        onGenerateRoute: AppRouter.onGenerateRoute(),
        initialRoute: AppRoutes.root,
      ),
    );
  }
}
