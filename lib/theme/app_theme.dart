import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  // Color Palette - Dark Mode
  static const Color primaryColor = Color(0xFF6366F1); // Indigo
  static const Color secondaryColor = Color(0xFF8B5CF6); // Purple
  static const Color accentColor = Color(0xFF06B6D4); // Cyan
  static const Color backgroundColor = Color(0xFF0F172A); // Dark blue-gray
  static const Color surfaceColor = Color(0xFF1E293B); // Lighter dark
  static const Color textPrimary = Color(0xFFF1F5F9); // Light gray
  static const Color textSecondary = Color(0xFF94A3B8); // Medium gray
  
  // Color Palette - Light Mode
  static const Color lightBackgroundColor = Color(0xFFF8FAFC); // Light gray
  static const Color lightSurfaceColor = Color(0xFFFFFFFF); // White
  static const Color lightTextPrimary = Color(0xFF0F172A); // Dark blue-gray
  static const Color lightTextSecondary = Color(0xFF475569); // Medium gray
  
  static ThemeData getTheme(bool isDarkMode) {
    return isDarkMode ? darkTheme : lightTheme;
  }
  
  static ThemeData get darkTheme {
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.dark,
      primaryColor: primaryColor,
      scaffoldBackgroundColor: backgroundColor,
      colorScheme: const ColorScheme.dark(
        primary: primaryColor,
        secondary: secondaryColor,
        tertiary: accentColor,
        surface: surfaceColor,
        background: backgroundColor,
        onPrimary: Colors.white,
        onSecondary: Colors.white,
        onSurface: textPrimary,
        onBackground: textPrimary,
      ),
      textTheme: GoogleFonts.interTextTheme(
        ThemeData.dark().textTheme.apply(
          bodyColor: textPrimary,
          displayColor: textPrimary,
        ),
      ),
      appBarTheme: AppBarTheme(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        titleTextStyle: GoogleFonts.inter(
          fontSize: 20,
          fontWeight: FontWeight.w600,
          color: textPrimary,
        ),
      ),
      cardTheme: CardThemeData(
        color: surfaceColor,
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
      ),
    );
  }
  
  static ThemeData get lightTheme {
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.light,
      primaryColor: primaryColor,
      scaffoldBackgroundColor: lightBackgroundColor,
      colorScheme: const ColorScheme.light(
        primary: primaryColor,
        secondary: secondaryColor,
        tertiary: accentColor,
        surface: lightSurfaceColor,
        background: lightBackgroundColor,
        onPrimary: Colors.white,
        onSecondary: Colors.white,
        onSurface: lightTextPrimary,
        onBackground: lightTextPrimary,
      ),
      textTheme: GoogleFonts.interTextTheme(
        ThemeData.light().textTheme.apply(
          bodyColor: lightTextPrimary,
          displayColor: lightTextPrimary,
        ),
      ),
      appBarTheme: AppBarTheme(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        titleTextStyle: GoogleFonts.inter(
          fontSize: 20,
          fontWeight: FontWeight.w600,
          color: lightTextPrimary,
        ),
      ),
      cardTheme: CardThemeData(
        color: lightSurfaceColor,
        elevation: 2,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
      ),
    );
  }
  
  // Helper methods to get colors based on theme
  static Color getBackgroundColor(bool isDarkMode) {
    return isDarkMode ? backgroundColor : lightBackgroundColor;
  }
  
  static Color getSurfaceColor(bool isDarkMode) {
    return isDarkMode ? surfaceColor : lightSurfaceColor;
  }
  
  static Color getTextPrimary(bool isDarkMode) {
    return isDarkMode ? textPrimary : lightTextPrimary;
  }
  
  static Color getTextSecondary(bool isDarkMode) {
    return isDarkMode ? textSecondary : lightTextSecondary;
  }
  
  // Gradient Colors
  static const LinearGradient primaryGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [primaryColor, secondaryColor],
  );
  
  static const LinearGradient accentGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [secondaryColor, accentColor],
  );
  
  // Text Styles
  static TextStyle get headingStyle => GoogleFonts.inter(
    fontSize: 48,
    fontWeight: FontWeight.bold,
    color: textPrimary,
    height: 1.2,
  );
  
  static TextStyle get subheadingStyle => GoogleFonts.inter(
    fontSize: 32,
    fontWeight: FontWeight.w600,
    color: textPrimary,
  );
  
  static TextStyle get bodyStyle => GoogleFonts.inter(
    fontSize: 16,
    color: textSecondary,
    height: 1.6,
  );
  
  static TextStyle get sectionTitleStyle => GoogleFonts.inter(
    fontSize: 36,
    fontWeight: FontWeight.bold,
    color: textPrimary,
  );
}

