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
}