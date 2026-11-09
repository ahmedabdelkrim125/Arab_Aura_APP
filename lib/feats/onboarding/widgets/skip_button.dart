import 'package:flutter/material.dart';
import '../../../core/const/app_colors.dart';
import '../../../core/const/app_text_styles.dart';
import '../../../core/utils/responsive_extension.dart';
import 'press_scale.dart';

class SkipButton extends StatelessWidget {
  final VoidCallback onTap;

  const SkipButton({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder<double>(
      tween: Tween<double>(begin: 0, end: 1),
      duration: const Duration(milliseconds: 800),
      curve: Curves.easeOutCubic,
      builder: (context, t, child) {
        return Opacity(
          opacity: t,
          child: Transform.translate(
            offset: Offset(0, (1 - t) * -16.h),
            child: child,
          ),
        );
      },
      child: PressScale(
        onTap: onTap,
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 18.w, vertical: 8.h),
          decoration: BoxDecoration(
            color: AppColors.surface,
            borderRadius: BorderRadius.circular(30.r),
          ),
          child: Text('تخطي', style: AppTextStyles.skip),
        ),
      ),
    );
  }
}
