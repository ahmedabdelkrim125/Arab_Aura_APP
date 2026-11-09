import 'package:flutter/material.dart';
import 'package:arab_ora_app/core/utils/responsive_extension.dart';
import 'package:arab_ora_app/core/widgets/app_button.dart';
import '../../../../core/const/app_text_styles.dart';
import 'google_logo.dart';

class SocialButtons extends StatelessWidget {
  final VoidCallback onApple;
  final VoidCallback onGoogle;

  const SocialButtons({
    super.key,
    required this.onApple,
    required this.onGoogle,
  });

  @override
  Widget build(BuildContext context) {
    final style = AppTextStyles.buttonLabel.copyWith(fontSize: 14.sp);

    return Row(
      spacing: 12.w,
      children: [
        Expanded(
          child: AppButton(
            label: 'الدخول بحساب Apple',
            variant: AppButtonVariant.outlined,
            height: 54.h,
            textStyle: style,
            leading: Icon(Icons.apple, size: 26.r, color: Colors.black),
            onPressed: onApple,
          ),
        ),
        Expanded(
          child: AppButton(
            label: 'الدخول بحساب Google',
            variant: AppButtonVariant.outlined,
            height: 54.h,
            textStyle: style,
            leading: GoogleLogo(size: 24.r),
            onPressed: onGoogle,
          ),
        ),
      ],
    );
  }
}