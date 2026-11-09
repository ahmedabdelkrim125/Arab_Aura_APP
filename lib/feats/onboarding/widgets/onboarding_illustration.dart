import 'dart:math';
import 'package:flutter/material.dart';
import 'package:arab_ora_app/core/utils/responsive_extension.dart';

import '../../../core/const/app_colors.dart';

class OnboardingIllustration extends StatelessWidget {
  final String image;
  final Animation<double> idle;

  const OnboardingIllustration({
    super.key,
    required this.image,
    required this.idle,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: [
        Positioned.fill(child: CustomPaint(painter: _PulsePainter(idle))),
        AnimatedBuilder(
          animation: idle,
          builder: (context, child) {
            final wave = sin(idle.value * 2 * pi);
            return Transform.translate(
              offset: Offset(0, wave * 10.h),
              child: Transform.rotate(angle: wave * 0.015, child: child),
            );
          },
          child: Image.asset(image, fit: BoxFit.contain),
        ),
      ],
    );
  }
}

class _PulsePainter extends CustomPainter {
  static const int _ringCount = 2;

  final Animation<double> idle;

  _PulsePainter(this.idle) : super(repaint: idle);

  @override
  void paint(Canvas canvas, Size size) {
    final center = size.center(Offset.zero);
    final maxRadius = size.shortestSide * 0.55;

    for (var i = 0; i < _ringCount; i++) {
      final phase = (idle.value + i / _ringCount) % 1.0;
      final eased = Curves.easeOut.transform(phase);
      final color = i.isEven ? AppColors.tealLight : AppColors.orange;

      final paint = Paint()
        ..style = PaintingStyle.stroke
        ..strokeWidth = 2.5 * (1 - eased) + 0.5
        ..color = color.withValues(alpha: (1 - eased) * 0.28);

      canvas.drawCircle(center, maxRadius * (0.5 + 0.5 * eased), paint);
    }
  }

  @override
  bool shouldRepaint(covariant _PulsePainter oldDelegate) => false;
}
