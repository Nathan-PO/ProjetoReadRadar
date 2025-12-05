import 'package:flutter/material.dart';
import 'colors.dart';

class AppSpacings {
  // Espaçamentos Padronizados (Sistema de 4 ou 8 pontos)
  static const double xs = 4.0;
  static const double s = 8.0;
  static const double m = 16.0;
  static const double l = 24.0;
  static const double xl = 32.0;
  static const double xxl = 48.0;
}

class AppTypography {
  // Font Family padrão do sistema (seguro para não dar erro de assets)
  static const String _fontFamily = 'Roboto';

  // --- H1: Títulos Grandes (Login, Headers Principais) ---
  static TextStyle h1(bool isDark) => TextStyle(
    fontFamily: _fontFamily,
    fontSize: 28,
    fontWeight: FontWeight.w800,
    color: AppColors.textPrimary(isDark),
    letterSpacing: -0.5,
  );

  // --- H2: Títulos de Seção / AppBar ---
  static TextStyle h2(bool isDark) => TextStyle(
    fontFamily: _fontFamily,
    fontSize: 20,
    fontWeight: FontWeight.bold,
    color: AppColors.textPrimary(isDark),
  );

  // --- H3: Títulos de Cards / Itens de Lista ---
  static TextStyle h3(bool isDark) => TextStyle(
    fontFamily: _fontFamily,
    fontSize: 16,
    fontWeight: FontWeight.w700,
    color: AppColors.textPrimary(isDark),
    height: 1.2,
  );

  // --- Body: Texto corrido (Sinopses, Descrições longas) ---
  static TextStyle body(bool isDark) => TextStyle(
    fontFamily: _fontFamily,
    fontSize: 16,
    fontWeight: FontWeight.normal,
    color: AppColors.textPrimary(isDark),
    height: 1.5,
  );

  // --- Caption: Detalhes pequenos (Autor, Data, Legendas) ---
  static TextStyle caption(bool isDark) => TextStyle(
    fontFamily: _fontFamily,
    fontSize: 14,
    fontWeight: FontWeight.w500,
    color: AppColors.textSecondary(isDark),
  );

  // --- Button Text: Texto dentro de botões (Sempre Branco/Contraste) ---
  static const TextStyle button = TextStyle(
    fontFamily: _fontFamily,
    fontSize: 16,
    fontWeight: FontWeight.bold,
    color: Colors.white, // Botões primários geralmente têm texto branco
    letterSpacing: 0.5,
  );
}