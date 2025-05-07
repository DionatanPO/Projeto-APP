import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'app_colors.dart';

class AppTheme {
  static final light = ThemeData(
    brightness: Brightness.light,
    scaffoldBackgroundColor: AppColors.backgroundLight,
    primaryColor: AppColors.primary,
    colorScheme: ColorScheme.light(
      primary: AppColors.primary,
      secondary: AppColors.accent,
      background: AppColors.backgroundLight,
    ),
    textTheme: TextTheme(
      bodyMedium: GoogleFonts.roboto(
        color: AppColors.textDark,
        fontWeight: FontWeight.normal,
        fontSize: 12,
      ),
      bodyLarge: GoogleFonts.roboto(
        color: AppColors.textDark,
        fontWeight: FontWeight.bold,
        fontSize: 16,
      ),
      displayLarge: GoogleFonts.roboto(
        color: AppColors.textDark,
        fontWeight: FontWeight.bold,
        fontSize: 20,
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.primary, // Cor do fundo do botão
        foregroundColor: Colors.white, // Cor do texto do botão
      ),
    ),
    iconTheme: IconThemeData(
      color: AppColors.primary, // Cor dos ícones
    ),
  );

  static final dark = ThemeData(
    brightness: Brightness.dark,
    scaffoldBackgroundColor: AppColors.backgroundDark,
    primaryColor: AppColors.primary,
    colorScheme: ColorScheme.dark(
      primary: AppColors.primary,
      secondary: AppColors.accent,
      background: AppColors.backgroundDark,
      // Fundo mais suave no modo dark
      surface: Color(0xFF1E1E1E),
      // Fundo para componentes como cards e listas
      onBackground: AppColors.textLight,
      onSurface: AppColors.textLight,
    ),
    textTheme: TextTheme(
      bodyMedium: GoogleFonts.roboto(
        color: AppColors.textLight,
        fontWeight: FontWeight.normal,
        fontSize: 12,
      ),
      bodyLarge: GoogleFonts.roboto(
        color: AppColors.textLight,
        fontWeight: FontWeight.bold,
        fontSize: 16,
      ),
      displayLarge: GoogleFonts.roboto(
        color: AppColors.textLight,
        fontWeight: FontWeight.bold,
        fontSize: 20,
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.primary, // Cor do fundo do botão
        foregroundColor: Colors.white, // Cor do texto do botão
      ),
    ),
    iconTheme: IconThemeData(
      color: AppColors.primary, // Cor dos ícones
    ),
    cardTheme: CardTheme(color: Color(0xFF1E1E1E)),
    // Para Cards
    bottomSheetTheme: BottomSheetThemeData(backgroundColor: Color(0xFF1E1E1E)),
    // Para Bottom Sheets
    listTileTheme: ListTileThemeData(
      tileColor: Color(0xFF1E1E1E), // Para ListTile
    ),
  );
}
