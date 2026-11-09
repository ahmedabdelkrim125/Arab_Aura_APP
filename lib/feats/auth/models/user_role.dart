import 'package:flutter/material.dart';
import 'package:arab_ora_app/core/routing/app_routes.dart';
import '../../../core/const/app_colors.dart';
import '../../../core/const/app_images.dart';

enum UserRole {
  merchant(
    title: 'تاجر',
    description: 'اعرض منتجاتك، وسَّع مبيعاتك ووصل لعملاء أكثر.',
    image: AppImages.roleMerchant,
    imageAlignment: Alignment(0.15, 1),
    accent: AppColors.merchantAccent,
    background: AppColors.merchantBackground,
    border: AppColors.merchantBorder,
    signupRoute: AppRoutes.merchantSignup,
  ),
  courier(
    title: 'مندوب توصيل',
    description: 'انضم لفريق التوصيل وابدأ تحقيق دخل مرن مع كل طلب.',
    image: AppImages.roleCourier,
    imageAlignment: Alignment(0.18, 1),
    accent: AppColors.courierAccent,
    background: AppColors.courierBackground,
    border: AppColors.courierBorder,
    signupRoute: AppRoutes.courierSignup,
  ),
  customer(
    title: 'مستخدم عادي',
    description: 'تسوّق من مختلف المتاجر واستمتع بأفضل العروض.',
    image: AppImages.roleCustomer,
    imageAlignment: Alignment(0.28, 1),
    accent: AppColors.customerAccent,
    background: AppColors.customerBackground,
    border: AppColors.customerBorder,
    signupRoute: AppRoutes.customerSignup,
  );

  const UserRole({
    required this.title,
    required this.description,
    required this.image,
    required this.imageAlignment,
    required this.accent,
    required this.background,
    required this.border,
    required this.signupRoute,
  });

  final String title;
  final String description;
  final String image;
  final Alignment imageAlignment;
  final Color accent;
  final Color background;
  final Color border;
  final String signupRoute;
}