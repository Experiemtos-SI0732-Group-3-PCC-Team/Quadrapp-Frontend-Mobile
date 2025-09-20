import 'package:flutter/material.dart';

class AppColors {
  // Colores principales Quadrapp
  static const Color primaryPurple = Color(0xFF9810FA);
  static const Color secondaryPurple = Color(0xFFC27AFF);
  static const Color lightPurple = Color(0xFFE8D5FF);

  // Colores del logo (degradado naranja)
  static const Color logoOrangeStart = Color(0xFFFF6B35);
  static const Color logoOrangeEnd = Color(0xFFFF4500);

  // Colores de fondo
  static const Color darkBackground = Color(0xFF1A1A1A);
  static const Color blackBackground = Color(0xFF000000);
  static const Color whiteBackground = Color(0xFFFFFFFF);

  // Colores de texto
  static const Color primaryText = Color(0xFFFFFFFF);
  static const Color secondaryText = Color(0xFFB0B0B0);
  static const Color darkText = Color(0xFF333333);
  static const Color hintText = Color(0xFF9E9E9E);

  // Colores de estado
  static const Color success = Color(0xFF4CAF50);
  static const Color error = Color(0xFFF44336);
  static const Color warning = Color(0xFFFF9800);
  static const Color info = Color(0xFF2196F3);

  // Colores adicionales
  static const Color cardBackground = Color(0xFF2A2A2A);
  static const Color inputBackground = Color(0xFFF5F5F5);
  static const Color borderColor = Color(0xFFE0E0E0);
  static const Color shadowColor = Color(0x1A000000);

  // Degradados
  static const LinearGradient primaryGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [primaryPurple, secondaryPurple],
  );

  static const LinearGradient logoGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [logoOrangeStart, logoOrangeEnd],
  );

  static const LinearGradient splashGradient = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [primaryPurple, secondaryPurple],
  );
}
