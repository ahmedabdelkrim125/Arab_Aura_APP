import 'package:flutter/material.dart';

class ShimmerSweep extends StatelessWidget {
  final Animation<double> progress;
  final Widget child;

  const ShimmerSweep({super.key, required this.progress, required this.child});

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: progress,
      child: child,
      builder: (context, child) {
        return ShaderMask(
          blendMode: BlendMode.srcATop,
          shaderCallback: (bounds) {
            return LinearGradient(
              begin: const Alignment(-1, -0.3),
              end: const Alignment(1, 0.3),
              colors: [
                Colors.transparent,
                Colors.white.withValues(alpha: 0.6),
                Colors.transparent,
              ],
              stops: const [0.35, 0.5, 0.65],
              transform: _SlideTransform(-1 + 2 * progress.value),
            ).createShader(bounds);
          },
          child: child,
        );
      },
    );
  }
}

class _SlideTransform extends GradientTransform {
  final double slide;

  const _SlideTransform(this.slide);

  @override
  Matrix4? transform(Rect bounds, {TextDirection? textDirection}) {
    return Matrix4.translationValues(bounds.width * slide, 0, 0);
  }
}
