import 'package:flutter/material.dart';
import '../const/app_colors.dart';
import '../const/app_text_styles.dart';
import 'app_palette.dart';

class AppTheme {
  AppTheme._();

  static final ThemeData light = _build(Brightness.light, AppPalette.light);
  static final ThemeData dark = _build(Brightness.dark, AppPalette.dark);

  static ThemeData _build(Brightness brightness, AppPalette palette) {
    final scheme =
        ColorScheme.fromSeed(
          seedColor: AppColors.teal,
          brightness: brightness,
        ).copyWith(
          primary: palette.primary,
          onPrimary: palette.onPrimary,
          surface: palette.background,
          onSurface: palette.text,
          error: palette.error,
          outline: palette.border,
        );

    return ThemeData(
      useMaterial3: true,
      brightness: brightness,
      colorScheme: scheme,
      scaffoldBackgroundColor: palette.background,
      canvasColor: palette.background,
      fontFamily: AppTextStyles.bodyFont,
      fontFamilyFallback: const [AppTextStyles.secondaryFont],
      dividerColor: palette.border,
      textSelectionTheme: TextSelectionThemeData(
        cursorColor: palette.accent,
        selectionHandleColor: palette.accent,
      ),
      bottomSheetTheme: BottomSheetThemeData(backgroundColor: palette.card),
      extensions: [palette],
    );
  }
}
