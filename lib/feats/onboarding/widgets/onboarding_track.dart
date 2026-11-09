import 'dart:math';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../../../core/const/app_colors.dart';

class OnboardingTrack extends StatelessWidget {
  final ValueListenable<double> page;
  final int count;

  const OnboardingTrack({super.key, required this.page, required this.count});

  @override
  Widget build(BuildContext context) {
    return RepaintBoundary(
      child: CustomPaint(
        painter: _TrackPainter(page, count),
        size: Size.infinite,
      ),
    );
  }
}

class _TrackPainter extends CustomPainter {
  static const double _inset = 16;
  static const double _step = 3;

  final ValueListenable<double> page;
  final int count;

  _TrackPainter(this.page, this.count) : super(repaint: page);

  double _y(double x, Size size) {
    return size.height / 2 +
        sin(x / size.width * 2 * pi * 1.25) * size.height * 0.22;
  }

  Path _path(double from, double to, Size size) {
    final path = Path()..moveTo(from, _y(from, size));
    for (var x = from + _step; x < to; x += _step) {
      path.lineTo(x, _y(x, size));
    }
    path.lineTo(to, _y(to, size));
    return path;
  }

  @override
  void paint(Canvas canvas, Size size) {
    final progress = (page.value / (count - 1)).clamp(0.0, 1.0);
    final span = size.width - _inset * 2;
    final headX = _inset + span * progress;
    final bounds = Offset.zero & size;

    final basePaint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round
      ..strokeWidth = 6
      ..shader = LinearGradient(
        colors: [
          AppColors.greyLight.withValues(alpha: 0),
          AppColors.greyLight,
          AppColors.greyLight,
          AppColors.greyLight.withValues(alpha: 0),
        ],
        stops: const [0, 0.25, 0.75, 1],
      ).createShader(bounds);
    canvas.drawPath(_path(_inset, size.width - _inset, size), basePaint);

    if (headX > _inset + 1) {
      final trailPaint = Paint()
        ..style = PaintingStyle.stroke
        ..strokeCap = StrokeCap.round
        ..strokeWidth = 7
        ..shader = LinearGradient(
          colors: [
            AppColors.tealLight.withValues(alpha: 0),
            AppColors.tealLight,
          ],
        ).createShader(Rect.fromLTRB(_inset, 0, headX, size.height));
      canvas.drawPath(_path(_inset, headX, size), trailPaint);
    }

    _paintMarkers(canvas, size, span, headX);
    _paintHead(canvas, size, headX, progress);
  }

  void _paintMarkers(Canvas canvas, Size size, double span, double headX) {
    for (var i = 0; i < count; i++) {
      final x = _inset + span * i / (count - 1);
      final passed = x < headX - 1;
      final paint = Paint()
        ..color = passed
            ? AppColors.tealLight.withValues(alpha: 0.55)
            : const Color(0xFFCBD3DB);

      canvas.save();
      canvas.translate(x, _y(x, size));
      canvas.rotate(pi / 4);
      canvas.drawRRect(
        RRect.fromRectAndRadius(
          Rect.fromCenter(center: Offset.zero, width: 10, height: 10),
          const Radius.circular(3),
        ),
        paint,
      );
      canvas.restore();
    }
  }

  void _paintHead(Canvas canvas, Size size, double headX, double progress) {
    final raw = page.value;
    final stretch = sin((raw - raw.floor()) * pi);
    final rect = RRect.fromRectAndRadius(
      Rect.fromCenter(center: Offset.zero, width: 22, height: 22),
      const Radius.circular(6),
    );

    canvas.save();
    canvas.translate(headX, _y(headX, size));
    canvas.scale(1 + 0.3 * stretch, 1 - 0.15 * stretch);
    canvas.rotate(pi / 4 + progress * pi * 2);
    canvas.drawRRect(
      rect.inflate(6),
      Paint()
        ..color = AppColors.orange.withValues(alpha: 0.45)
        ..maskFilter = const MaskFilter.blur(BlurStyle.normal, 10),
    );
    canvas.drawRRect(rect, Paint()..color = AppColors.orange);
    canvas.restore();
  }

  @override
  bool shouldRepaint(covariant _TrackPainter oldDelegate) {
    return oldDelegate.count != count;
  }
}
