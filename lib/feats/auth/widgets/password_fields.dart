import 'package:flutter/material.dart';
import 'package:arab_ora_app/core/utils/responsive_extension.dart';
import 'package:arab_ora_app/core/utils/validators.dart';
import 'package:arab_ora_app/core/widgets/app_text_field.dart';

class PasswordFields extends StatelessWidget {
  final TextEditingController password;
  final TextEditingController confirm;

  const PasswordFields({
    super.key,
    required this.password,
    required this.confirm,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 12.h,
      children: [
        AppTextField(
          controller: password,
          hint: 'كلمة المرور',
          prefixIcon: Icons.lock_outline_rounded,
          isPassword: true,
          autofillHints: const [AutofillHints.newPassword],
          validator: Validators.password,
        ),
        AppTextField(
          controller: confirm,
          hint: 'تأكيد كلمة المرور',
          prefixIcon: Icons.lock_outline_rounded,
          isPassword: true,
          textInputAction: TextInputAction.done,
          validator: Validators.confirmPassword(password),
        ),
      ],
    );
  }
}