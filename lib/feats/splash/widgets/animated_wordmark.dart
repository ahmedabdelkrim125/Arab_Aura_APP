import 'package:flutter/material.dart';
import 'package:arab_ora_app/core/theme/app_palette.dart';
import 'package:arab_ora_app/core/utils/responsive_extension.dart';

import '../../../core/const/app_images.dart';
import '../splash_animations.dart';

class AnimatedWordmark extends StatelessWidget {
  final SplashAnimations animations;

  const AnimatedWordmark({super.key, required this.animations});

  @override
  Widget build(BuildContext context) {
    final asset = context.colors.isDark
        ? AppImages.wordmarkDark
        : AppImages.wordmark;

    return AnimatedBuilder(
      animation: animations.wordmarkReveal,
      builder: (context, child) {
        final value = animations.wordmarkReveal.value;
        return Opacity(
          opacity: value.clamp(0.0, 1.0),
          child: ClipRect(
            child: Align(
              alignment: Alignment.centerRight,
              widthFactor: value,
              child: child,
            ),
          ),
        );
      },
      child: Image.asset(asset, width: 240.w, fit: BoxFit.contain),
    );
  }
}
