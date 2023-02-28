import 'package:flutter/material.dart';

import '../utils/colors.dart';

ThemeData appTheme({required Color color}) {
  return ThemeData(
    fontFamily: 'Oswald',
    primaryColor: AppColors.primaryColor1,
    hintColor: AppColors.hintColor,
    brightness: Brightness.light,
    scaffoldBackgroundColor: Colors.transparent,
  );
}
