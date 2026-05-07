import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  static ThemeData get theme {
    final base = ThemeData(
      useMaterial3: true,
      colorScheme: ColorScheme.fromSeed(
        seedColor: const Color(0xFF4A6572), // Slate blue
        brightness: Brightness.light,
        surface: const Color(0xFFF9FAFB), // Clinical off-white
      ),
    );
    
    return base.copyWith(
      textTheme: GoogleFonts.interTextTheme(base.textTheme).apply(
        bodyColor: const Color(0xFF2C3E50),
        displayColor: const Color(0xFF2C3E50),
      ),
      scaffoldBackgroundColor: const Color(0xFFF9FAFB),
    );
  }
}
