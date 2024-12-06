import 'package:flutter/material.dart';

class AppColor {
  static const ColorScheme schemeColorApp = ColorScheme(
    brightness: Brightness.light,
    primary: primaryColor,
    onPrimary: onPrimaryColor,
    primaryContainer: primaryColorContainer,
    onPrimaryContainer: onPrimaryColorContainer,
    secondary: secondaryColor,
    onSecondary: onSecondaryColor,
    secondaryContainer: secondaryColorContainer,
    onSecondaryContainer: onSecondaryColorContainer,
    tertiary: tertiaryColor,
    onTertiary: onTertiaryColor,
    tertiaryContainer: tertiaryColorContainer,
    onTertiaryContainer: onTertiaryColorContainer,
    error: erroColor,
    onError: onErroColor,
    surface: surfaceColor,
    onSurface: onSurfaceColor,
    surfaceContainer: onSurfaceColor,
  );

  ///Cores primárias
  static const Color primaryColor = Color(0xFF4785A5);
  static const Color onPrimaryColor = Color(0xFFFFFFFF);
  static const Color primaryColorContainer = Color(0xFF85C3E3);
  static const Color onPrimaryColorContainer = Color(0xFF034161);

  ///Cores secundárias
  static const Color secondaryColor = primaryColor;
  static const Color onSecondaryColor = onPrimaryColor;
  static const Color secondaryColorContainer = Color(0xFF85C3E3);
  static const Color onSecondaryColorContainer = onPrimaryColorContainer;

  ///Cores Terceárias
  static const Color tertiaryColor = Color(0xFF0BBC52);
  static const Color onTertiaryColor = onPrimaryColor;
  static const Color tertiaryColorContainer = Color(0xFF3CED83);
  static const Color onTertiaryColorContainer = Color(0xFF006F2C);

  ///Cores de fundo
  static const Color surfaceColor = Color(0xFFDBFFFF);
  static const Color onSurfaceColor = Color(0xFF296787);

  ///Cores de erro
  static const Color erroColor = Color(0xFFF43148);
  static const Color onErroColor = onPrimaryColor;

  ///Cores text
  static const Color textFormeField = Color(0xFF575959);
}
