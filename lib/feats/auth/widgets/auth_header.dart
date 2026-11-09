import 'package:flutter/material.dart';
import 'package:arab_ora_app/core/utils/responsive_extension.dart';
import '../../../core/const/app_colors.dart';
import '../../../core/const/app_text_styles.dart';

class AuthHeader extends StatelessWidget {
  final String titleStart;
  final String titleEnd;
  final String subtitle;

  const AuthHeader({
    super.key,
    required this.titleStart,
    required this.titleEnd,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Wrap(
          alignment: WrapAlignment.center,
          spacing: 10.w,
          children: [
            Text(titleStart, style: AppTextStyles.authTitle),
            ShaderMask(
              blendMode: BlendMode.srcIn,
              shaderCallback: (bounds) => const LinearGradient(
                colors: [AppColors.teal, AppColors.tealLight],
              ).createShader(bounds),
              child: Text(titleEnd, style: AppTextStyles.authTitle),
            ),
          ],
        ),
        SizedBox(height: 12.h),
        Text(
          subtitle,
          textAlign: TextAlign.center,
          style: AppTextStyles.authSubtitle,
        ),
      ],
    );
  }
}