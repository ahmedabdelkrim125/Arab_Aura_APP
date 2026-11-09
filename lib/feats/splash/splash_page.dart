import 'package:arab_ora_app/feats/splash/splash_animations.dart';
import 'package:flutter/material.dart';
import 'package:arab_ora_app/core/routing/app_routes.dart';
import 'package:arab_ora_app/core/utils/responsive_extension.dart';
import 'widgets/animated_logo.dart';
import 'widgets/animated_wordmark.dart';
import 'widgets/shimmer_sweep.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final SplashAnimations _animations;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: SplashAnimations.duration,
    );
    _animations = SplashAnimations(_controller);
    _controller.forward().whenComplete(_goNext);
  }

  Future<void> _goNext() async {
    await Future.delayed(const Duration(milliseconds: 500));
    if (!mounted) return;
    Navigator.of(context).pushReplacementNamed(AppRoutes.onboarding);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ShimmerSweep(
          progress: _animations.shimmer,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              AnimatedLogo(animations: _animations),
              SizedBox(height: 12.h),
              AnimatedWordmark(animations: _animations),
            ],
          ),
        ),
      ),
    );
  }
}
