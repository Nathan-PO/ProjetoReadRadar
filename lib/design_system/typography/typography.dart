import 'package:flutter/material.dart';
import '../colors/colors.dart';


class AppTypography {
  // Fonte padrão
  static const String fontFamily = 'Family';

  // Título
  static const TextStyle title = TextStyle(
    fontFamily: fontFamily,
    fontSize: 28,
    fontWeight: FontWeight.w600,
  );

  // Subtítulo
  static const TextStyle subtitle = TextStyle(
    fontFamily: fontFamily,
    fontSize: 22,
    fontWeight: FontWeight.w400,
  );

  // Corpo de texto
  static const TextStyle bodyText = TextStyle(
    fontFamily: fontFamily,
    fontSize: 14,
    fontWeight: FontWeight.w400,
  );

  static TextTheme lightTextTheme = const TextTheme();

  // Tema escuro (valores básicos)
  static TextTheme darkTextTheme = const TextTheme();
}