import 'package:flutter/material.dart';

class SplashAnimations {
  static const Duration duration = Duration(milliseconds: 3400);

  final AnimationController controller;
  final Animation<double> aura;
  final Animation<double> logoScale;
  final Animation<double> logoOpacity;
  final Animation<double> logoTurn;
  final Animation<double> wordmarkReveal;
  final Animation<double> shimmer;

  SplashAnimations(this.controller)
    : aura = CurvedAnimation(
        parent: controller,
        curve: const Interval(0.0, 0.85, curve: Curves.easeOut),
      ),
      logoScale = Tween<double>(begin: 0, end: 1).animate(
        CurvedAnimation(
          parent: controller,
          curve: const Interval(0.05, 0.45, curve: Curves.easeOutBack),
        ),
      ),
      logoOpacity = CurvedAnimation(
        parent: controller,
        curve: const Interval(0.05, 0.25),
      ),
      logoTurn = Tween<double>(begin: -0.35, end: 0).animate(
        CurvedAnimation(
          parent: controller,
          curve: const Interval(0.05, 0.45, curve: Curves.easeOutBack),
        ),
      ),
      wordmarkReveal = CurvedAnimation(
        parent: controller,
        curve: const Interval(0.4, 0.75, curve: Curves.easeOutCubic),
      ),
      shimmer = CurvedAnimation(
        parent: controller,
        curve: const Interval(0.72, 1.0, curve: Curves.easeInOut),
      );
}
