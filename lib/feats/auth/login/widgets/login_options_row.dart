import 'package:flutter/material.dart';
import 'package:arab_ora_app/core/localization/app_strings.dart';
import 'package:arab_ora_app/core/utils/responsive_extension.dart';
import 'package:arab_ora_app/core/widgets/app_checkbox.dart';
import '../../../../core/const/app_text_styles.dart';

class LoginOptionsRow extends StatelessWidget {
  final bool remember;
  final ValueChanged<bool> onRememberChanged;
  final VoidCallback? onForgotPassword;

  const LoginOptionsRow({
    super.key,
    required this.remember,
    required this.onRememberChanged,
    this.onForgotPassword,
  });

  @override
  Widget build(BuildContext context) {
    final strings = AppStrings.of(context);

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        GestureDetector(
          behavior: HitTestBehavior.opaque,
          onTap: () => onRememberChanged(!remember),
          child: Row(
            spacing: 10.w,
            children: [
              AppCheckbox(value: remember, onChanged: onRememberChanged),
              Text(strings.rememberMe, style: AppTextStyles.caption(context)),
            ],
          ),
        ),
        GestureDetector(
          behavior: HitTestBehavior.opaque,
          onTap: onForgotPassword,
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 6.h),
            child: Text(
              strings.forgotPassword,
              style: AppTextStyles.link(context),
            ),
          ),
        ),
      ],
    );
  }
}
