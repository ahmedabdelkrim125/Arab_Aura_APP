import 'package:flutter/material.dart';
import 'package:arab_ora_app/core/utils/responsive_extension.dart';

class FadeSlideIn extends StatelessWidget {
  static const int _baseMs = 500;
  static const int _stepMs = 70;

  final int index;
  final Widget child;

  const FadeSlideIn({super.key, required this.child, this.index = 0});

  @override
  Widget build(BuildContext context) {
    final totalMs = _baseMs + index * _stepMs;

    return TweenAnimationBuilder<double>(
      tween: Tween<double>(begin: 0, end: 1),
      duration: Duration(milliseconds: totalMs),
      curve: Interval(index * _stepMs / totalMs, 1, curve: Curves.easeOutCubic),
      builder: (context, t, child) {
        return Opacity(
          opacity: t,
          child: Transform.translate(
            offset: Offset(0, (1 - t) * 24.h),
            child: child,
          ),
        );
      },
      child: child,
    );
  }
}
