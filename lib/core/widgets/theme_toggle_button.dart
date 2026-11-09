import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:arab_ora_app/core/const/app_images.dart';
import 'package:arab_ora_app/core/theme/app_palette.dart';
import 'package:arab_ora_app/core/theme/theme_cubit.dart';
import 'package:arab_ora_app/core/utils/responsive_extension.dart';

class ThemeToggleButton extends StatefulWidget {
  const ThemeToggleButton({super.key});

  @override
  State<ThemeToggleButton> createState() => _ThemeToggleButtonState();
}

class _ThemeToggleButtonState extends State<ThemeToggleButton>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller = AnimationController(
    vsync: this,
    duration: const Duration(milliseconds: 900),
    value: 1,
  );

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    precacheImage(const AssetImage(AppImages.lightMode), context);
    precacheImage(const AssetImage(AppImages.darkMode), context);
  }

  void _toggle() {
    if (_controller.isAnimating) return;
    HapticFeedback.selectionClick();
    _controller.forward(from: 0);
    context.read<ThemeCubit>().toggle();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final palette = context.colors;
    final isDark = context.watch<ThemeCubit>().state == ThemeMode.dark;
    final size = 48.r;
    final iconSize = size * 0.82;
    final orbitRadius = size * 0.26;
    final incoming = isDark ? AppImages.darkMode : AppImages.lightMode;
    final outgoing = isDark ? AppImages.lightMode : AppImages.darkMode;

    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: _toggle,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 600),
        width: size,
        height: size,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: palette.surface,
          border: Border.all(color: palette.border),
        ),
        child: ClipOval(
          child: AnimatedBuilder(
            animation: _controller,
            builder: (context, _) {
              final t = Curves.easeInOutCubic.transform(_controller.value);
              final radius = orbitRadius * math.sin(math.pi * t);
              final angle = 2 * math.pi * t;
              final offset = Offset(
                radius * math.cos(angle),
                radius * math.sin(angle),
              );

              return Stack(
                alignment: Alignment.center,
                children: [
                  if (t < 1)
                    _OrbitBody(
                      asset: outgoing,
                      size: iconSize,
                      offset: offset,
                      opacity: 1 - t,
                      scale: 1 - 0.4 * t,
                      turn: t * math.pi / 2,
                    ),
                  _OrbitBody(
                    asset: incoming,
                    size: iconSize,
                    offset: -offset,
                    opacity: t,
                    scale: 0.6 + 0.4 * t,
                    turn: -(1 - t) * math.pi / 2,
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}

class _OrbitBody extends StatelessWidget {
  final String asset;
  final double size;
  final Offset offset;
  final double opacity;
  final double scale;
  final double turn;

  const _OrbitBody({
    required this.asset,
    required this.size,
    required this.offset,
    required this.opacity,
    required this.scale,
    required this.turn,
  });

  @override
  Widget build(BuildContext context) {
    return Transform.translate(
      offset: offset,
      child: Opacity(
        opacity: opacity.clamp(0.0, 1.0),
        child: Transform.rotate(
          angle: turn,
          child: Transform.scale(
            scale: scale,
            child: Image.asset(
              asset,
              width: size,
              height: size,
              fit: BoxFit.contain,
            ),
          ),
        ),
      ),
    );
  }
}
