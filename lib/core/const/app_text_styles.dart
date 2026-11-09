import 'package:flutter/material.dart';
import 'package:arab_ora_app/core/utils/responsive_extension.dart';

import 'app_colors.dart';

class AppTextStyles {
  AppTextStyles._();

  static const String primaryFont = 'Tajawal';
  static const String displayFont = 'Zanjabeel';

  static TextStyle get onboardingTitle => TextStyle(
        fontFamily: displayFont,
        fontSize: 26.sp,
        fontWeight: FontWeight.w800,
        height: 1.4,
        color: AppColors.navy,
      );

  static TextStyle get onboardingSubtitle => TextStyle(
        fontFamily: displayFont,
        fontSize: 15.sp,
        fontWeight: FontWeight.w500,
        height: 1.8,
        color: AppColors.grey,
      );

  static TextStyle get button => TextStyle(
        fontFamily: displayFont,
        fontSize: 16.sp,
        fontWeight: FontWeight.w700,
        color: Colors.white,
      );

  static TextStyle get skip => TextStyle(
        fontFamily: displayFont,
        fontSize: 14.sp,
        fontWeight: FontWeight.w600,
        color: AppColors.grey,
      );

  static TextStyle get authTitle => TextStyle(
        fontFamily: primaryFont,
        fontSize: 34.sp,
        fontWeight: FontWeight.w700,
        height: 1.3,
        color: AppColors.navy,
      );

  static TextStyle get authSubtitle => TextStyle(
        fontFamily: primaryFont,
        fontSize: 15.sp,
        fontWeight: FontWeight.w400,
        height: 1.7,
        color: AppColors.grey,
      );

  static TextStyle get cardTitle => TextStyle(
        fontFamily: primaryFont,
        fontSize: 20.sp,
        fontWeight: FontWeight.w700,
        color: AppColors.navy,
      );

  static TextStyle get cardDescription => TextStyle(
        fontFamily: primaryFont,
        fontSize: 13.sp,
        fontWeight: FontWeight.w400,
        height: 1.6,
        color: AppColors.grey,
      );

  static TextStyle get fieldLabel => TextStyle(
        fontFamily: primaryFont,
        fontSize: 14.sp,
        fontWeight: FontWeight.w700,
        color: AppColors.navy,
      );

  static TextStyle get fieldText => TextStyle(
        fontFamily: primaryFont,
        fontSize: 15.sp,
        fontWeight: FontWeight.w400,
        color: AppColors.navy,
      );

  static TextStyle get fieldHint => TextStyle(
        fontFamily: primaryFont,
        fontSize: 15.sp,
        fontWeight: FontWeight.w400,
        color: AppColors.hint,
      );

  static TextStyle get fieldError => TextStyle(
        fontFamily: primaryFont,
        fontSize: 12.sp,
        fontWeight: FontWeight.w400,
        color: AppColors.error,
      );

  static TextStyle get buttonLabel => TextStyle(
        fontFamily: primaryFont,
        fontSize: 17.sp,
        fontWeight: FontWeight.w700,
        color: Colors.white,
      );

  static TextStyle get caption => TextStyle(
        fontFamily: primaryFont,
        fontSize: 14.sp,
        fontWeight: FontWeight.w400,
        color: AppColors.grey,
      );

  static TextStyle get link => TextStyle(
        fontFamily: primaryFont,
        fontSize: 14.sp,
        fontWeight: FontWeight.w700,
        color: AppColors.tealLight,
      );
}