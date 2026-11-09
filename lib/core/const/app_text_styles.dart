import 'package:flutter/material.dart';
import 'package:arab_ora_app/core/theme/app_palette.dart';
import 'package:arab_ora_app/core/utils/responsive_extension.dart';

class AppTextStyles {
  AppTextStyles._();

  static const String displayFont = 'IBMPlexSansArabic';
  static const String bodyFont = 'IBMPlexArabic';
  static const String secondaryFont = 'Tajawal';

  static const List<String> _fallback = [secondaryFont];

  static TextStyle _style({
    required String family,
    required double size,
    required FontWeight weight,
    required Color color,
    double? height,
  }) {
    return TextStyle(
      fontFamily: family,
      fontFamilyFallback: _fallback,
      fontSize: size,
      fontWeight: weight,
      height: height,
      color: color,
    );
  }

  static TextStyle onboardingTitle(BuildContext context) => _style(
    family: displayFont,
    size: 26.sp,
    weight: FontWeight.w800,
    height: 1.4,
    color: context.colors.text,
  );

  static TextStyle onboardingSubtitle(BuildContext context) => _style(
    family: bodyFont,
    size: 15.sp,
    weight: FontWeight.w500,
    height: 1.8,
    color: context.colors.textSecondary,
  );

  static TextStyle button(BuildContext context) => _style(
    family: displayFont,
    size: 16.sp,
    weight: FontWeight.w700,
    color: context.colors.onPrimary,
  );

  static TextStyle skip(BuildContext context) => _style(
    family: secondaryFont,
    size: 14.sp,
    weight: FontWeight.w600,
    color: context.colors.textSecondary,
  );

  static TextStyle authTitle(BuildContext context) => _style(
    family: displayFont,
    size: 34.sp,
    weight: FontWeight.w700,
    height: 1.3,
    color: context.colors.text,
  );

  static TextStyle authSubtitle(BuildContext context) => _style(
    family: bodyFont,
    size: 15.sp,
    weight: FontWeight.w400,
    height: 1.7,
    color: context.colors.textSecondary,
  );

  static TextStyle cardTitle(BuildContext context) => _style(
    family: displayFont,
    size: 20.sp,
    weight: FontWeight.w700,
    color: context.colors.text,
  );

  static TextStyle cardDescription(BuildContext context) => _style(
    family: secondaryFont,
    size: 13.sp,
    weight: FontWeight.w400,
    height: 1.6,
    color: context.colors.textSecondary,
  );

  static TextStyle fieldLabel(BuildContext context) => _style(
    family: bodyFont,
    size: 14.sp,
    weight: FontWeight.w700,
    color: context.colors.text,
  );

  static TextStyle fieldText(BuildContext context) => _style(
    family: bodyFont,
    size: 15.sp,
    weight: FontWeight.w400,
    color: context.colors.text,
  );

  static TextStyle fieldHint(BuildContext context) => _style(
    family: secondaryFont,
    size: 15.sp,
    weight: FontWeight.w400,
    color: context.colors.hint,
  );

  static TextStyle fieldError(BuildContext context) => _style(
    family: secondaryFont,
    size: 12.sp,
    weight: FontWeight.w400,
    color: context.colors.error,
  );

  static TextStyle buttonLabel(BuildContext context) => _style(
    family: displayFont,
    size: 17.sp,
    weight: FontWeight.w700,
    color: context.colors.onPrimary,
  );

  static TextStyle caption(BuildContext context) => _style(
    family: secondaryFont,
    size: 14.sp,
    weight: FontWeight.w400,
    color: context.colors.textSecondary,
  );

  static TextStyle link(BuildContext context) => _style(
    family: secondaryFont,
    size: 14.sp,
    weight: FontWeight.w700,
    color: context.colors.link,
  );
}
