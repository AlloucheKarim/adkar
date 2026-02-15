import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppColors {
  static const Color primary = Color(0xFFF4C6D7);
  static const Color secondary = Color(0xFFFFF6EC);
  static const Color accent = Color(0xFFE6C98A);
  static const Color background = Color(0xFFFFF8F0);
  static const Color surface = Color(0xFFFAE8EE);
  static const Color textPrimary = Color(0xFF4A4A4A);
  static const Color textSecondary = Color(0xFF8A8A8A);

  static List<BoxShadow> get premiumShadow => [
    BoxShadow(
      color: const Color(0xFFC09D63).withValues(alpha: 0.15),
      blurRadius: 20,
      offset: const Offset(0, 10),
    ),
    BoxShadow(
      color: Colors.white.withValues(alpha: 0.8),
      blurRadius: 10,
      offset: const Offset(-5, -5),
    ),
  ];
}

class AppTypography {
  static TextStyle header({Color? color, double fontSize = 28}) =>
      GoogleFonts.notoNaskhArabic(
        fontSize: fontSize,
        fontWeight: FontWeight.w500, // Medium
        color: color ?? AppColors.textPrimary,
        height: 1.3,
      );

  static TextStyle uiTitle({Color? color}) => GoogleFonts.notoNaskhArabic(
    fontSize: 24,
    fontWeight: FontWeight.w500, // Medium
    color: color ?? AppColors.textPrimary,
    height: 1.3,
  );

  static TextStyle uiBody({
    Color? color,
    double fontSize = 16,
    FontWeight? fontWeight,
  }) => GoogleFonts.notoNaskhArabic(
    fontSize: fontSize,
    fontWeight: fontWeight ?? FontWeight.normal,
    color: color ?? AppColors.textPrimary,
    height: 1.5,
  );

  static TextStyle arabic({Color? color, double fontSize = 28}) =>
      GoogleFonts.notoNaskhArabic(
        fontSize: fontSize,
        height: 1.6,
        color: color ?? AppColors.textPrimary,
      );

  static TextStyle thuluth({Color? color, double fontSize = 32}) => TextStyle(
    fontFamily: 'Thuluth',
    fontSize: fontSize,
    height: 1.6,
    color: color ?? AppColors.textPrimary,
  );

  static TextStyle scheherazade({
    Color? color,
    double fontSize = 20,
    FontWeight? fontWeight,
  }) => GoogleFonts.scheherazadeNew(
    fontSize: fontSize,
    fontWeight: fontWeight ?? FontWeight.normal,
    color: color ?? AppColors.textPrimary,
    height: 1.5,
  );
}
