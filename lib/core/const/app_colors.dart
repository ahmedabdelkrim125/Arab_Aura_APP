import 'package:flutter/material.dart';

class AppColors {
  AppColors._();

  static const Color navy = Color(0xFF05325A);
  static const Color navyLight = Color(0xFF0B5C9E);
  static const Color teal = Color(0xFF038C84);
  static const Color tealLight = Color(0xFF00B894);
  static const Color orange = Color(0xFFF97F3B);
  static const Color grey = Color(0xFF7B8794);
  static const Color greyLight = Color(0xFFE3E8EE);
  static const Color surface = Color(0xFFF1F4F7);
  static const Color background = Colors.white;

  static const Color fieldFill = Color(0xFFF6F8FA);
  static const Color border = Color(0xFFE5EAF0);
  static const Color hint = Color(0xFF9AA5B1);
  static const Color error = Color(0xFFE5484D);

  static const Color merchantAccent = Color(0xFF12A4C9);
  static const Color merchantBackground = Color(0xFFEAF9FC);
  static const Color merchantBorder = Color(0xFFC9EEF5);

  static const Color courierAccent = Color(0xFFF97F3B);
  static const Color courierBackground = Color(0xFFFFF6EC);
  static const Color courierBorder = Color(0xFFFBE3CC);

  static const Color customerAccent = Color(0xFF1E88F0);
  static const Color customerBackground = Color(0xFFEBF4FF);
  static const Color customerBorder = Color(0xFFCFE3FA);

  static const LinearGradient primaryGradient = LinearGradient(
    begin: Alignment.centerLeft,
    end: Alignment.centerRight,
    colors: [navy, navyLight],
  );

  static const Color darkPrimary = Color(0xFF445A68);
  static const Color darkPrimaryLight = Color(0xFF52697A);
  static const Color darkSecondary = Color(0xFF737373);
  static const Color darkBackground = Color(0xFF10181E);
  static const Color darkSurface = Color(0xFF1A252D);
  static const Color darkCard = Color(0xFF16212A);
  static const Color darkBorder = Color(0xFF2B3A45);
  static const Color darkText = Color(0xFFE8EEF3);
  static const Color darkError = Color(0xFFFF6B6F);
  static const Color darkTrackMarker = Color(0xFF3A4A56);

  static const Color darkMerchantBackground = Color(0xFF14282F);
  static const Color darkMerchantBorder = Color(0xFF1F4350);
  static const Color darkCourierBackground = Color(0xFF2B2119);
  static const Color darkCourierBorder = Color(0xFF4A3622);
  static const Color darkCustomerBackground = Color(0xFF15222F);
  static const Color darkCustomerBorder = Color(0xFF23405C);

  static const LinearGradient darkPrimaryGradient = LinearGradient(
    begin: Alignment.centerLeft,
    end: Alignment.centerRight,
    colors: [darkPrimary, darkPrimaryLight],
  );
}
