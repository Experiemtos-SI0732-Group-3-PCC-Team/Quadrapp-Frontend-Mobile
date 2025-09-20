import 'package:flutter/material.dart';
import 'app_colors.dart';

class AppTypography {
  static const String _fontFamily = 'System';

  // Tamaños de fuente
  static const double h1Size = 32.0;
  static const double h2Size = 28.0;
  static const double h3Size = 24.0;
  static const double h4Size = 20.0;
  static const double h5Size = 18.0;
  static const double h6Size = 16.0;
  static const double bodyLargeSize = 16.0;
  static const double bodyMediumSize = 14.0;
  static const double bodySmallSize = 12.0;
  static const double captionSize = 10.0;

  // Títulos
  static const TextStyle h1 = TextStyle(
    fontFamily: _fontFamily,
    fontSize: h1Size,
    fontWeight: FontWeight.bold,
    color: AppColors.primaryText,
    height: 1.2,
  );

  static const TextStyle h2 = TextStyle(
    fontFamily: _fontFamily,
    fontSize: h2Size,
    fontWeight: FontWeight.bold,
    color: AppColors.primaryText,
    height: 1.3,
  );

  static const TextStyle h3 = TextStyle(
    fontFamily: _fontFamily,
    fontSize: h3Size,
    fontWeight: FontWeight.w600,
    color: AppColors.primaryText,
    height: 1.3,
  );

  static const TextStyle h4 = TextStyle(
    fontFamily: _fontFamily,
    fontSize: h4Size,
    fontWeight: FontWeight.w600,
    color: AppColors.primaryText,
    height: 1.4,
  );

  static const TextStyle h5 = TextStyle(
    fontFamily: _fontFamily,
    fontSize: h5Size,
    fontWeight: FontWeight.w500,
    color: AppColors.primaryText,
    height: 1.4,
  );

  static const TextStyle h6 = TextStyle(
    fontFamily: _fontFamily,
    fontSize: h6Size,
    fontWeight: FontWeight.w500,
    color: AppColors.primaryText,
    height: 1.4,
  );

  // Texto del cuerpo
  static const TextStyle bodyLarge = TextStyle(
    fontFamily: _fontFamily,
    fontSize: bodyLargeSize,
    fontWeight: FontWeight.normal,
    color: AppColors.primaryText,
    height: 1.5,
  );

  static const TextStyle bodyMedium = TextStyle(
    fontFamily: _fontFamily,
    fontSize: bodyMediumSize,
    fontWeight: FontWeight.normal,
    color: AppColors.primaryText,
    height: 1.5,
  );

  static const TextStyle bodySmall = TextStyle(
    fontFamily: _fontFamily,
    fontSize: bodySmallSize,
    fontWeight: FontWeight.normal,
    color: AppColors.secondaryText,
    height: 1.5,
  );

  // Texto de formularios
  static const TextStyle inputLabel = TextStyle(
    fontFamily: _fontFamily,
    fontSize: bodyMediumSize,
    fontWeight: FontWeight.w500,
    color: AppColors.darkText,
    height: 1.4,
  );

  static const TextStyle inputText = TextStyle(
    fontFamily: _fontFamily,
    fontSize: bodyLargeSize,
    fontWeight: FontWeight.normal,
    color: AppColors.darkText,
    height: 1.4,
  );

  static const TextStyle inputHint = TextStyle(
    fontFamily: _fontFamily,
    fontSize: bodyLargeSize,
    fontWeight: FontWeight.normal,
    color: AppColors.hintText,
    height: 1.4,
  );

  // Texto de botones
  static const TextStyle buttonLarge = TextStyle(
    fontFamily: _fontFamily,
    fontSize: bodyLargeSize,
    fontWeight: FontWeight.w600,
    color: AppColors.primaryText,
    height: 1.2,
  );

  static const TextStyle buttonMedium = TextStyle(
    fontFamily: _fontFamily,
    fontSize: bodyMediumSize,
    fontWeight: FontWeight.w600,
    color: AppColors.primaryText,
    height: 1.2,
  );

  // Texto especial
  static const TextStyle appTitle = TextStyle(
    fontFamily: _fontFamily,
    fontSize: h2Size,
    fontWeight: FontWeight.bold,
    color: AppColors.primaryText,
    letterSpacing: 1.2,
    height: 1.2,
  );

  static const TextStyle link = TextStyle(
    fontFamily: _fontFamily,
    fontSize: bodyMediumSize,
    fontWeight: FontWeight.w500,
    color: AppColors.primaryPurple,
    decoration: TextDecoration.underline,
    height: 1.4,
  );

  static const TextStyle caption = TextStyle(
    fontFamily: _fontFamily,
    fontSize: captionSize,
    fontWeight: FontWeight.normal,
    color: AppColors.secondaryText,
    height: 1.3,
  );

  // Variaciones de color
  static TextStyle h1Dark = h1.copyWith(color: AppColors.darkText);
  static TextStyle h2Dark = h2.copyWith(color: AppColors.darkText);
  static TextStyle h3Dark = h3.copyWith(color: AppColors.darkText);
  static TextStyle bodyLargeDark = bodyLarge.copyWith(
    color: AppColors.darkText,
  );
  static TextStyle bodyMediumDark = bodyMedium.copyWith(
    color: AppColors.darkText,
  );
}
