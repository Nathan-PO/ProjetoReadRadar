import 'package:flutter/material.dart';

class AppColors {
  // --- Paleta Base (Ninguém usa isso direto na tela) ---
  static const Color _brandPrimary = Color(0xFF6C63FF);
  static const Color _brandSecondary = Color(0xFF2196F3);

  static const Color _darkBackground = Color(0xFF121212);
  static const Color _lightBackground = Color(0xFFF4F6F8);

  static const Color _darkSurface = Color(0xFF1E1E1E);
  static const Color _lightSurface = Colors.white;

  static const Color _textDarkMain = Colors.white;
  static const Color _textLightMain = Color(0xFF2D3142);

  static const Color _textDarkSec = Color(0xFFB0B3C1);
  static const Color _textLightSec = Color(0xFF9094A6);

  static const Color _error = Color(0xFFFF6B6B);
  static const Color _success = Color(0xFF4ECC5C);

  // --- Cores Semânticas (USE ESTAS NA TELA) ---

  // Cor principal da marca
  static Color get primary => _brandPrimary;
  static Color get error => _error;
  static Color get success => _success;

  // Retorna a cor de fundo correta baseada no tema
  static Color background(bool isDark) => isDark ? _darkBackground : _lightBackground;

  // Retorna a cor de superfície (cards, appbar) correta
  static Color surface(bool isDark) => isDark ? _darkSurface : _lightSurface;

  // Retorna a cor de texto principal correta
  static Color textPrimary(bool isDark) => isDark ? _textDarkMain : _textLightMain;

  // Retorna a cor de texto secundário correta
  static Color textSecondary(bool isDark) => isDark ? _textDarkSec : _textLightSec;

  // Retorna cor para ícones
  static Color icon(bool isDark) => isDark ? _textDarkMain : _textLightMain;
}