import 'package:flutter/material.dart';

class AppSize {
  static late MediaQueryData _mediaQueryData;
  static late double screenWidth;
  static late double screenHeight;

  static double designWidth = 414;
  static double designHeight = 896;

  static void init(BuildContext context) {
    _mediaQueryData = MediaQuery.of(context);
    screenWidth = _mediaQueryData.size.width;
    screenHeight = _mediaQueryData.size.height;
  }

  static double w(double px) {
    return (px / designWidth) * screenWidth;
  }

  static double h(double px) {
    return (px / designHeight) * screenHeight;
  }
}
