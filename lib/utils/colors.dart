import 'package:flutter/material.dart';

class AppColors {
  // example
  static const Color primaryColor1 = Color(0xFF01C3CC);
  static const Color primaryColor2 = Color(0xFF3D73F0);
  static const Color secondaryColor = Color(0xFF830D3F);
  static const Color hintColor = Color.fromRGBO(0, 0, 0, 0.66);
  static const Color searchBarBorderColor = Color(0xFFD9D9D9);

  static const Color cardBorderColor1 = Color(0xFF01C3CC);
  static const Color cardBorderColor2 = Color(0xFF3F56F2);
  static const Color cardBorderColor3 = Color(0xFF830D3F);

  static const Color homeSliderDotsColor = Color(0xFFD2D2D2);

  static const Color gradientColor = Color(0xFF7D89FF);
  static const Color gradientColor2 = Color(0xFF3C5BF0);

  static mainGradient() {
    return const RadialGradient(
      colors: [
        primaryColor1,
        primaryColor2,
      ],
      stops: [
        0.25,
        1.0,
      ],
      radius: 3,
    );
  }

  static Gradient secondGradient () {
    return const LinearGradient(
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
      colors: [
        primaryColor1,
        AppColors.gradientColor,
      ],
      stops: [
        0.25,
        1.0,
      ],
    );
  }

  static customGradient({
    required Color color1,
    required Color color2,
    Color? color3,
    required Alignment begin,
    required Alignment end,
    required double stop1,
    required double stop2,
    double? stop3,
  }) {
    return LinearGradient(
      begin: begin,
      end: end,
      colors: [
        color1,
        color2,
        if (color3 != null) color3,
      ],
      stops: [
        stop1,
        stop2,
        if (stop3 != null) stop3,
      ],
    );
  }
}
