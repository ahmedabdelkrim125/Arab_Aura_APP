import 'dart:math';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:arab_ora_app/core/theme/app_palette.dart';
import '../../../core/const/app_colors.dart';

class OnboardingBackdrop extends StatelessWidget {
  final ValueListenable<double> page;
  final Animation<double> idle;
  final int count;

  const OnboardingBackdrop({
    super.key,
    required this.page,
    required this.idle,
    required this.count,
  });

  @override
  Widget build(BuildContext context) {
    final palette = context.colors;

    return RepaintBoundary(
      child: CustomPaint(
        painter: _BackdropPainter(
          page,
          idle,
          count,
          palette.isDark ? palette.primary : AppColors.navy,
          palette.isDark ? 0.22 : 0.08,
        ),
        size: Size.infinite,
      ),
    );
  }
}

class _BackdropPainter extends CustomPainter {
  final ValueListenable<double> page;
  final Animation<double> idle;
  final int count;
  final Color baseColor;
  final double baseAlpha;

  _BackdropPainter(
    this.page,
    this.idle,
    this.count,
    this.baseColor,
    this.baseAlpha,
  ) : super(repaint: Listenable.merge([page, idle]));

  @override
  void paint(Canvas canvas, Size size) {
    final progress = (page.value / (count - 1)).clamp(0.0, 1.0);
    final sway = sin(idle.value * 2 * pi);

    _blob(
      canvas,
      Offset(
        size.width * (0.9 - 0.8 * progress),
        size.height * 0.16 + sway * 14,
      ),
      size.width * 0.75,
      AppColors.tealLight,
      0.16,
    );
    _blob(
      canvas,
      Offset(
        size.width * (0.05 + 0.9 * progress),
        size.height * 0.6 - sway * 18,
      ),
      size.width * 0.6,
      AppColors.orange,
      0.12,
    );
    _blob(
      canvas,
      Offset(size.width * 0.5, size.height),
      size.width * 0.8,
      baseColor,
      baseAlpha,
    );
  }

  void _blob(
    Canvas canvas,
    Offset center,
    double radius,
    Color color,
    double alpha,
  ) {
    final paint = Paint()
      ..shader = RadialGradient(
        colors: [
          color.withValues(alpha: alpha),
          color.withValues(alpha: 0),
        ],
      ).createShader(Rect.fromCircle(center: center, radius: radius));
    canvas.drawCircle(center, radius, paint);
  }

  @override
  bool shouldRepaint(covariant _BackdropPainter oldDelegate) {
    return oldDelegate.count != count ||
        oldDelegate.baseColor != baseColor ||
        oldDelegate.baseAlpha != baseAlpha;
  }
}
