import 'package:flutter/material.dart';
import 'package:arab_ora_app/core/localization/app_strings.dart';
import 'package:arab_ora_app/core/routing/app_routes.dart';
import 'package:arab_ora_app/core/theme/app_palette.dart';
import '../../../core/const/app_colors.dart';
import '../../../core/const/app_images.dart';

enum UserRole {
  merchant(
    image: AppImages.roleMerchant,
    imageAlignment: Alignment(0.15, 1),
    accent: AppColors.merchantAccent,
    signupRoute: AppRoutes.merchantSignup,
  ),
  courier(
    image: AppImages.roleCourier,
    imageAlignment: Alignment(0.18, 1),
    accent: AppColors.courierAccent,
    signupRoute: AppRoutes.courierSignup,
  ),
  customer(
    image: AppImages.roleCustomer,
    imageAlignment: Alignment(0.28, 1),
    accent: AppColors.customerAccent,
    signupRoute: AppRoutes.customerSignup,
  );

  const UserRole({
    required this.image,
    required this.imageAlignment,
    required this.accent,
    required this.signupRoute,
  });

  final String image;
  final Alignment imageAlignment;
  final Color accent;
  final String signupRoute;

  String title(AppStrings strings) {
    return switch (this) {
      UserRole.merchant => strings.roleMerchantTitle,
      UserRole.courier => strings.roleCourierTitle,
      UserRole.customer => strings.roleCustomerTitle,
    };
  }

  String description(AppStrings strings) {
    return switch (this) {
      UserRole.merchant => strings.roleMerchantDescription,
      UserRole.courier => strings.roleCourierDescription,
      UserRole.customer => strings.roleCustomerDescription,
    };
  }

  Color background(AppPalette palette) {
    return switch (this) {
      UserRole.merchant => palette.merchantBackground,
      UserRole.courier => palette.courierBackground,
      UserRole.customer => palette.customerBackground,
    };
  }

  Color border(AppPalette palette) {
    return switch (this) {
      UserRole.merchant => palette.merchantBorder,
      UserRole.courier => palette.courierBorder,
      UserRole.customer => palette.customerBorder,
    };
  }
}
