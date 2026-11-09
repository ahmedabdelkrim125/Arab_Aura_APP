import 'package:flutter/material.dart';
import '../const/app_colors.dart';

@immutable
class AppPalette extends ThemeExtension<AppPalette> {
  const AppPalette({
    required this.isDark,
    required this.background,
    required this.surface,
    required this.card,
    required this.fieldFill,
    required this.border,
    required this.primary,
    required this.onPrimary,
    required this.primaryGradient,
    required this.text,
    required this.textSecondary,
    required this.hint,
    required this.link,
    required this.accent,
    required this.error,
    required this.trackBase,
    required this.trackMarker,
    required this.merchantBackground,
    required this.merchantBorder,
    required this.courierBackground,
    required this.courierBorder,
    required this.customerBackground,
    required this.customerBorder,
  });

  final bool isDark;
  final Color background;
  final Color surface;
  final Color card;
  final Color fieldFill;
  final Color border;
  final Color primary;
  final Color onPrimary;
  final LinearGradient primaryGradient;
  final Color text;
  final Color textSecondary;
  final Color hint;
  final Color link;
  final Color accent;
  final Color error;
  final Color trackBase;
  final Color trackMarker;
  final Color merchantBackground;
  final Color merchantBorder;
  final Color courierBackground;
  final Color courierBorder;
  final Color customerBackground;
  final Color customerBorder;

  static const AppPalette light = AppPalette(
    isDark: false,
    background: AppColors.background,
    surface: AppColors.surface,
    card: Colors.white,
    fieldFill: AppColors.fieldFill,
    border: AppColors.border,
    primary: AppColors.navy,
    onPrimary: Colors.white,
    primaryGradient: AppColors.primaryGradient,
    text: AppColors.navy,
    textSecondary: AppColors.grey,
    hint: AppColors.hint,
    link: AppColors.tealLight,
    accent: AppColors.tealLight,
    error: AppColors.error,
    trackBase: AppColors.greyLight,
    trackMarker: Color(0xFFCBD3DB),
    merchantBackground: AppColors.merchantBackground,
    merchantBorder: AppColors.merchantBorder,
    courierBackground: AppColors.courierBackground,
    courierBorder: AppColors.courierBorder,
    customerBackground: AppColors.customerBackground,
    customerBorder: AppColors.customerBorder,
  );

  static const AppPalette dark = AppPalette(
    isDark: true,
    background: AppColors.darkBackground,
    surface: AppColors.darkSurface,
    card: AppColors.darkCard,
    fieldFill: AppColors.darkSurface,
    border: AppColors.darkBorder,
    primary: AppColors.darkPrimary,
    onPrimary: Colors.white,
    primaryGradient: AppColors.darkPrimaryGradient,
    text: AppColors.darkText,
    textSecondary: AppColors.darkSecondary,
    hint: AppColors.darkSecondary,
    link: AppColors.tealLight,
    accent: AppColors.tealLight,
    error: AppColors.darkError,
    trackBase: AppColors.darkBorder,
    trackMarker: AppColors.darkTrackMarker,
    merchantBackground: AppColors.darkMerchantBackground,
    merchantBorder: AppColors.darkMerchantBorder,
    courierBackground: AppColors.darkCourierBackground,
    courierBorder: AppColors.darkCourierBorder,
    customerBackground: AppColors.darkCustomerBackground,
    customerBorder: AppColors.darkCustomerBorder,
  );

  @override
  AppPalette copyWith({
    bool? isDark,
    Color? background,
    Color? surface,
    Color? card,
    Color? fieldFill,
    Color? border,
    Color? primary,
    Color? onPrimary,
    LinearGradient? primaryGradient,
    Color? text,
    Color? textSecondary,
    Color? hint,
    Color? link,
    Color? accent,
    Color? error,
    Color? trackBase,
    Color? trackMarker,
    Color? merchantBackground,
    Color? merchantBorder,
    Color? courierBackground,
    Color? courierBorder,
    Color? customerBackground,
    Color? customerBorder,
  }) {
    return AppPalette(
      isDark: isDark ?? this.isDark,
      background: background ?? this.background,
      surface: surface ?? this.surface,
      card: card ?? this.card,
      fieldFill: fieldFill ?? this.fieldFill,
      border: border ?? this.border,
      primary: primary ?? this.primary,
      onPrimary: onPrimary ?? this.onPrimary,
      primaryGradient: primaryGradient ?? this.primaryGradient,
      text: text ?? this.text,
      textSecondary: textSecondary ?? this.textSecondary,
      hint: hint ?? this.hint,
      link: link ?? this.link,
      accent: accent ?? this.accent,
      error: error ?? this.error,
      trackBase: trackBase ?? this.trackBase,
      trackMarker: trackMarker ?? this.trackMarker,
      merchantBackground: merchantBackground ?? this.merchantBackground,
      merchantBorder: merchantBorder ?? this.merchantBorder,
      courierBackground: courierBackground ?? this.courierBackground,
      courierBorder: courierBorder ?? this.courierBorder,
      customerBackground: customerBackground ?? this.customerBackground,
      customerBorder: customerBorder ?? this.customerBorder,
    );
  }

  @override
  AppPalette lerp(ThemeExtension<AppPalette>? other, double t) {
    if (other is! AppPalette) return this;
    Color c(Color a, Color b) => Color.lerp(a, b, t)!;
    return AppPalette(
      isDark: t < 0.5 ? isDark : other.isDark,
      background: c(background, other.background),
      surface: c(surface, other.surface),
      card: c(card, other.card),
      fieldFill: c(fieldFill, other.fieldFill),
      border: c(border, other.border),
      primary: c(primary, other.primary),
      onPrimary: c(onPrimary, other.onPrimary),
      primaryGradient: LinearGradient.lerp(
        primaryGradient,
        other.primaryGradient,
        t,
      )!,
      text: c(text, other.text),
      textSecondary: c(textSecondary, other.textSecondary),
      hint: c(hint, other.hint),
      link: c(link, other.link),
      accent: c(accent, other.accent),
      error: c(error, other.error),
      trackBase: c(trackBase, other.trackBase),
      trackMarker: c(trackMarker, other.trackMarker),
      merchantBackground: c(merchantBackground, other.merchantBackground),
      merchantBorder: c(merchantBorder, other.merchantBorder),
      courierBackground: c(courierBackground, other.courierBackground),
      courierBorder: c(courierBorder, other.courierBorder),
      customerBackground: c(customerBackground, other.customerBackground),
      customerBorder: c(customerBorder, other.customerBorder),
    );
  }
}

extension AppPaletteContext on BuildContext {
  AppPalette get colors => Theme.of(this).extension<AppPalette>()!;
}
