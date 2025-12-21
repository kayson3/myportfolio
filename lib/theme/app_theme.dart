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
  
  // Color Palette - Light Mode (more vibrant and distinct)
  static const Color lightPrimaryColor = Color(0xFF4F46E5); // Deeper indigo for better contrast
  static const Color lightSecondaryColor = Color(0xFF7C3AED); // Vibrant purple
  static const Color lightAccentColor = Color(0xFF0891B2); // Deeper cyan
  static const Color lightBackgroundColor = Color(0xFFFFFFFF); // Pure white
  static const Color lightSurfaceColor = Color(0xFFF8FAFC); // Very light gray
  static const Color lightTextPrimary = Color(0xFF1E293B); // Darker slate for better readability
  static const Color lightTextSecondary = Color(0xFF64748B); // Medium slate gray
  static const Color lightBorderColor = Color(0xFFE2E8F0); // Light border color
  
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
        onPrimary: Colors.white,
        onSecondary: Colors.white,
        onSurface: textPrimary,
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
      dividerTheme: const DividerThemeData(
        color: Color(0xFF334155),
        thickness: 1,
      ),
    );
  }
  
  static ThemeData get lightTheme {
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.light,
      primaryColor: lightPrimaryColor,
      scaffoldBackgroundColor: lightBackgroundColor,
      colorScheme: const ColorScheme.light(
        primary: lightPrimaryColor,
        secondary: lightSecondaryColor,
        tertiary: lightAccentColor,
        surface: lightSurfaceColor,
        onPrimary: Colors.white,
        onSecondary: Colors.white,
        onSurface: lightTextPrimary,
        outline: lightBorderColor,
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
        elevation: 4,
        shadowColor: Colors.black.withOpacity(0.08),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
          side: BorderSide(
            color: lightBorderColor,
            width: 1,
          ),
        ),
      ),
      dividerTheme: const DividerThemeData(
        color: lightBorderColor,
        thickness: 1,
      ),
      inputDecorationTheme: InputDecorationTheme(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: lightBorderColor),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: lightBorderColor),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: lightPrimaryColor, width: 2),
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
  
  // Text Styles (theme-aware)
  static TextStyle headingStyle(bool isDarkMode) => GoogleFonts.inter(
    fontSize: 48,
    fontWeight: FontWeight.bold,
    color: getTextPrimary(isDarkMode),
    height: 1.2,
  );
  
  static TextStyle subheadingStyle(bool isDarkMode) => GoogleFonts.inter(
    fontSize: 32,
    fontWeight: FontWeight.w600,
    color: getTextPrimary(isDarkMode),
  );
  
  static TextStyle bodyStyle(bool isDarkMode) => GoogleFonts.inter(
    fontSize: 16,
    color: getTextSecondary(isDarkMode),
    height: 1.6,
  );
  
  static TextStyle sectionTitleStyle(bool isDarkMode) => GoogleFonts.inter(
    fontSize: 36,
    fontWeight: FontWeight.bold,
    color: getTextPrimary(isDarkMode),
  );
  
  // Gradient Colors (theme-aware)
  static LinearGradient primaryGradient(bool isDarkMode) => LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: isDarkMode 
      ? [primaryColor, secondaryColor]
      : [lightPrimaryColor, lightSecondaryColor],
  );
  
  static LinearGradient accentGradient(bool isDarkMode) => LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: isDarkMode
      ? [secondaryColor, accentColor]
      : [lightSecondaryColor, lightAccentColor],
  );
  
  // Get border color based on theme
  static Color getBorderColor(bool isDarkMode) {
    return isDarkMode ? const Color(0xFF334155) : lightBorderColor;
  }
}

