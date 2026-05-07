import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  static const Color primaryNavy = Color(0xFF1A237E);
  static const Color accentBlue = Color(0xFF3F51B5);
  static const Color backgroundLight = Color(0xFFF8F9FA);
  static const Color textDark = Color(0xFF212121);
  static const Color textMedium = Color(0xFF424242);

  static ThemeData get theme {
    final base = ThemeData(
      useMaterial3: true,
      colorScheme: ColorScheme.fromSeed(
        seedColor: primaryNavy,
        primary: primaryNavy,
        secondary: accentBlue,
        surface: Colors.white,
        background: backgroundLight,
        brightness: Brightness.light,
      ),
    );
    
    return base.copyWith(
      textTheme: GoogleFonts.interTextTheme(base.textTheme).copyWith(
        displayLarge: GoogleFonts.playfairDisplay(
          textStyle: base.textTheme.displayLarge?.copyWith(
            fontWeight: FontWeight.bold,
            color: primaryNavy,
          ),
        ),
        displayMedium: GoogleFonts.playfairDisplay(
          textStyle: base.textTheme.displayMedium?.copyWith(
            fontWeight: FontWeight.bold,
            color: primaryNavy,
          ),
        ),
        displaySmall: GoogleFonts.playfairDisplay(
          textStyle: base.textTheme.displaySmall?.copyWith(
            fontWeight: FontWeight.bold,
            color: primaryNavy,
          ),
        ),
        headlineLarge: GoogleFonts.playfairDisplay(
          textStyle: base.textTheme.headlineLarge?.copyWith(
            fontWeight: FontWeight.bold,
            color: primaryNavy,
          ),
        ),
        headlineMedium: GoogleFonts.playfairDisplay(
          textStyle: base.textTheme.headlineMedium?.copyWith(
            fontWeight: FontWeight.w600,
            color: primaryNavy,
          ),
        ),
      ).apply(
        bodyColor: textDark,
        displayColor: primaryNavy,
      ),
      scaffoldBackgroundColor: backgroundLight,
      appBarTheme: const AppBarTheme(
        backgroundColor: Colors.white,
        foregroundColor: primaryNavy,
        elevation: 0,
        centerTitle: false,
      ),
    );
  }
}
