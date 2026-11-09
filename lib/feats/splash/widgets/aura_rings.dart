import 'package:flutter/material.dart';

import '../../../core/const/app_colors.dart';

class AuraRings extends StatelessWidget {
  final Animation<double> progress;
  final double size;

  const AuraRings({super.key, required this.progress, required this.size});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: size,
      height: size,
      child: CustomPaint(painter: _AuraPainter(progress)),
    );
  }
}

class _AuraPainter extends CustomPainter {
  static const int _ringCount = 3;
  static const double _stagger = 0.2;
  static const double _span = 0.6;

  final Animation<double> progress;

  _AuraPainter(this.progress) : super(repaint: progress);

  @override
  void paint(Canvas canvas, Size size) {
    final center = size.center(Offset.zero);
    final maxRadius = size.shortestSide / 2;

    for (var i = 0; i < _ringCount; i++) {
      final t = ((progress.value - i * _stagger) / _span).clamp(0.0, 1.0);
      if (t <= 0) continue;

      final eased = Curves.easeOut.transform(t);
      final color = i.isEven ? AppColors.teal : AppColors.orange;

      final paint = Paint()
        ..style = PaintingStyle.stroke
        ..strokeWidth = 4 * (1 - eased) + 0.5
        ..color = color.withValues(alpha: (1 - eased) * 0.55);

      canvas.drawCircle(center, maxRadius * (0.4 + 0.6 * eased), paint);
    }
  }

  @override
  bool shouldRepaint(covariant _AuraPainter oldDelegate) {
    return oldDelegate.progress != progress;
  }
}
