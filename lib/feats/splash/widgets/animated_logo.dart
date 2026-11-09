import 'package:arab_ora_app/feats/splash/widgets/aura_rings.dart';
import 'package:flutter/material.dart';

import '../../../core/const/app_images.dart';
import '../../../core/utils/responsive_extension.dart';
import '../splash_animations.dart';

class AnimatedLogo extends StatelessWidget {
  final SplashAnimations animations;

  const AnimatedLogo({super.key, required this.animations});

  @override
  Widget build(BuildContext context) {
    final logoSize = 140.w;
    final auraSize = 340.w;

    return SizedBox(
      width: logoSize,
      height: logoSize,
      child: Stack(
        alignment: Alignment.center,
        clipBehavior: Clip.none,
        children: [
          OverflowBox(
            maxWidth: auraSize,
            maxHeight: auraSize,
            child: AuraRings(progress: animations.aura, size: auraSize),
          ),
          AnimatedBuilder(
            animation: animations.controller,
            builder: (context, child) {
              return Opacity(
                opacity: animations.logoOpacity.value,
                child: Transform.rotate(
                  angle: animations.logoTurn.value,
                  child: Transform.scale(
                    scale: animations.logoScale.value,
                    child: child,
                  ),
                ),
              );
            },
            child: Image.asset(
              AppImages.logo,
              width: logoSize,
              fit: BoxFit.contain,
            ),
          ),
        ],
      ),
    );
  }
}
