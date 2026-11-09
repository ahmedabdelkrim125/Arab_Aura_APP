import 'package:flutter/material.dart';
import 'package:arab_ora_app/core/utils/responsive_extension.dart';
import '../../../core/const/app_colors.dart';
import '../../../core/const/app_text_styles.dart';

class OnboardingTitle extends StatelessWidget {
  static const double _delay = 0.15;
  static const double _stagger = 0.08;
  static const double _span = 0.3;

  final String start;
  final String end;
  final double progress;

  const OnboardingTitle({
    super.key,
    required this.start,
    required this.end,
    required this.progress,
  });

  @override
  Widget build(BuildContext context) {
    final words = [
      ...start.split(' ').map((text) => _Word(text, false)),
      ...end.split(' ').map((text) => _Word(text, true)),
    ];

    return Wrap(
      textDirection: TextDirection.rtl,
      alignment: WrapAlignment.center,
      spacing: 8.w,
      runSpacing: 2.h,
      children: [
        for (var i = 0; i < words.length; i++) _buildWord(words[i], i),
      ],
    );
  }

  Widget _buildWord(_Word word, int index) {
    final t = Curves.easeOutCubic.transform(
      ((progress - _delay - index * _stagger) / _span).clamp(0.0, 1.0),
    );

    Widget text = Text(
      word.text,
      textDirection: TextDirection.rtl,
      style: AppTextStyles.onboardingTitle,
    );

    if (word.highlighted) {
      text = ShaderMask(
        blendMode: BlendMode.srcIn,
        shaderCallback: (bounds) => const LinearGradient(
          colors: [AppColors.teal, AppColors.tealLight],
        ).createShader(bounds),
        child: text,
      );
    }

    return Opacity(
      opacity: t,
      child: Transform.translate(
        offset: Offset(0, (1 - t) * 28.h),
        child: Transform.scale(scale: 0.85 + 0.15 * t, child: text),
      ),
    );
  }
}

class _Word {
  final String text;
  final bool highlighted;

  const _Word(this.text, this.highlighted);
}
