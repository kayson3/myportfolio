import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  // Refreshed Color Palette - Dark Mode
  static const Color primaryColor = Color(0xFF0EA5A4); // Teal
  static const Color secondaryColor = Color(0xFF7C3AED); // Purple
  static const Color accentColor = Color(0xFFFFB020); // Amber
  static const Color backgroundColor = Color(0xFF0B1220); // Deep navy
  static const Color surfaceColor = Color(0xFF0F1724); // Panel dark
  static const Color textPrimary = Color(0xFFE6F0F6); // Off-white
  static const Color textSecondary = Color(0xFF9AA6B2); // Muted

  // Refreshed Color Palette - Light Mode
  static const Color lightPrimaryColor = Color(0xFF0369A1); // Strong blue
  static const Color lightSecondaryColor = Color(0xFF7C3AED); // Purple
  static const Color lightAccentColor = Color(0xFFFB923C); // Warm orange
  static const Color lightBackgroundColor = Color(0xFFF7FAFC); // Soft white
  static const Color lightSurfaceColor = Color(0xFFFFFFFF); // White surface
  static const Color lightTextPrimary = Color(0xFF0F1724); // Dark slate
  static const Color lightTextSecondary = Color(0xFF475569); // Slate
  static const Color lightBorderColor = Color(0xFFE6EEF6);

  // Typography choices
  static TextStyle headingFont(bool isDarkMode) => GoogleFonts.poppins(
    fontWeight: FontWeight.w700,
    color: isDarkMode ? textPrimary : lightTextPrimary,
  );

  static TextStyle bodyFont(bool isDarkMode) =>
      GoogleFonts.inter(color: isDarkMode ? textSecondary : lightTextSecondary);

  static ThemeData getTheme(bool isDarkMode) {
    return isDarkMode ? darkTheme : lightTheme;
  }

  static ThemeData get darkTheme {
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.dark,
      primaryColor: primaryColor,
      scaffoldBackgroundColor: backgroundColor,
      colorScheme: ColorScheme.dark(
        primary: primaryColor,
        secondary: secondaryColor,
        tertiary: accentColor,
        surface: surfaceColor,
        onPrimary: Colors.white,
        onSecondary: Colors.white,
        onSurface: textPrimary,
      ),
      textTheme:
          GoogleFonts.interTextTheme(
            ThemeData.dark().textTheme.apply(
              bodyColor: textSecondary,
              displayColor: textPrimary,
            ),
          ).copyWith(
            displayLarge: headingFont(
              true,
            ).copyWith(fontSize: 48, height: 1.08),
            displayMedium: headingFont(
              true,
            ).copyWith(fontSize: 36, height: 1.12),
            titleLarge: GoogleFonts.poppins(
              fontSize: 20,
              fontWeight: FontWeight.w600,
              color: textPrimary,
            ),
          ),
      appBarTheme: AppBarTheme(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        titleTextStyle: GoogleFonts.poppins(
          fontSize: 20,
          fontWeight: FontWeight.w600,
          color: textPrimary,
        ),
      ),
      cardTheme: CardThemeData(
        color: surfaceColor,
        elevation: 6,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
        shadowColor: Colors.black.withAlpha((0.45 * 255).round()),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          textStyle: GoogleFonts.inter(fontWeight: FontWeight.w600),
        ),
      ),
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          textStyle: GoogleFonts.inter(fontWeight: FontWeight.w600),
        ),
      ),
      dividerTheme: const DividerThemeData(
        color: Color(0xFF26323C),
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
      colorScheme: ColorScheme.light(
        primary: lightPrimaryColor,
        secondary: lightSecondaryColor,
        tertiary: lightAccentColor,
        surface: lightSurfaceColor,
        onPrimary: Colors.white,
        onSecondary: Colors.white,
        onSurface: lightTextPrimary,
        outline: lightBorderColor,
      ),
      textTheme:
          GoogleFonts.interTextTheme(
            ThemeData.light().textTheme.apply(
              bodyColor: lightTextSecondary,
              displayColor: lightTextPrimary,
            ),
          ).copyWith(
            displayLarge: headingFont(
              false,
            ).copyWith(fontSize: 48, height: 1.08),
            displayMedium: headingFont(
              false,
            ).copyWith(fontSize: 36, height: 1.12),
            titleLarge: GoogleFonts.poppins(
              fontSize: 20,
              fontWeight: FontWeight.w600,
              color: lightTextPrimary,
            ),
          ),
      appBarTheme: AppBarTheme(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        titleTextStyle: GoogleFonts.poppins(
          fontSize: 20,
          fontWeight: FontWeight.w600,
          color: lightTextPrimary,
        ),
      ),
      cardTheme: CardThemeData(
        color: lightSurfaceColor,
        elevation: 6,
        shadowColor: Colors.black.withAlpha((0.06 * 255).round()),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(14),
          side: BorderSide(color: lightBorderColor, width: 1),
        ),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: lightPrimaryColor,
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          textStyle: GoogleFonts.inter(
            fontWeight: FontWeight.w600,
            color: Colors.white,
          ),
        ),
      ),
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          textStyle: GoogleFonts.inter(
            fontWeight: FontWeight.w600,
            color: lightPrimaryColor,
          ),
        ),
      ),
      dividerTheme: DividerThemeData(color: lightBorderColor, thickness: 1),
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
          borderSide: BorderSide(color: lightPrimaryColor, width: 2),
        ),
      ),
    );
  }

  // Helper methods to get colors based on theme
  static Color getBackgroundColor(bool isDarkMode) =>
      isDarkMode ? backgroundColor : lightBackgroundColor;
  static Color getSurfaceColor(bool isDarkMode) =>
      isDarkMode ? surfaceColor : lightSurfaceColor;
  static Color getTextPrimary(bool isDarkMode) =>
      isDarkMode ? textPrimary : lightTextPrimary;
  static Color getTextSecondary(bool isDarkMode) =>
      isDarkMode ? textSecondary : lightTextSecondary;

  // Text Styles (theme-aware)
  static TextStyle headingStyle(bool isDarkMode) =>
      headingFont(isDarkMode).copyWith(fontSize: 48, height: 1.08);
  static TextStyle subheadingStyle(bool isDarkMode) => headingFont(
    isDarkMode,
  ).copyWith(fontSize: 28, fontWeight: FontWeight.w600);
  static TextStyle bodyStyle(bool isDarkMode) =>
      bodyFont(isDarkMode).copyWith(fontSize: 16, height: 1.6);
  static TextStyle sectionTitleStyle(bool isDarkMode) => headingFont(
    isDarkMode,
  ).copyWith(fontSize: 36, fontWeight: FontWeight.w700);

  // Gradients (theme-aware)
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

  static Color getBorderColor(bool isDarkMode) =>
      isDarkMode ? const Color(0xFF1E2A36) : lightBorderColor;
}
