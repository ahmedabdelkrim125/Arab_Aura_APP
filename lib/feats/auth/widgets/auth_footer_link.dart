import 'package:flutter/material.dart';
import 'package:arab_ora_app/core/utils/responsive_extension.dart';
import '../../../core/const/app_text_styles.dart';

class AuthFooterLink extends StatelessWidget {
  final String text;
  final String linkText;
  final VoidCallback onTap;

  const AuthFooterLink({
    super.key,
    required this.text,
    required this.linkText,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Wrap(
      alignment: WrapAlignment.center,
      crossAxisAlignment: WrapCrossAlignment.center,
      spacing: 4.w,
      children: [
        Text(text, style: AppTextStyles.caption(context)),
        GestureDetector(
          behavior: HitTestBehavior.opaque,
          onTap: onTap,
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 6.h),
            child: Text(linkText, style: AppTextStyles.link(context)),
          ),
        ),
      ],
    );
  }
}
