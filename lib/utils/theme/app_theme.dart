import 'package:delivery_app/utils/theme/app_colors.dart';
import 'package:delivery_app/utils/theme/app_fonts.dart';
import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData get getTheme => ThemeData(
    fontFamily:AppFonts.poppins,
    primaryColor: AppColors.primary,
    scaffoldBackgroundColor: AppColors.backgorund,
    appBarTheme: AppBarTheme(
      backgroundColor: AppColors.backgorund,
      centerTitle: true,
    ),
  );
}
