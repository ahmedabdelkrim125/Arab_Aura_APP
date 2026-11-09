import 'package:flutter/material.dart';
import 'package:solar_icons/solar_icons.dart';
import 'package:arab_ora_app/core/localization/app_strings.dart';
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
    final strings = AppStrings.of(context);

    return Column(
      spacing: 12.h,
      children: [
        AppTextField(
          controller: password,
          hint: strings.password,
          prefixIcon: SolarIconsOutline.lock,
          isPassword: true,
          autofillHints: const [AutofillHints.newPassword],
          validator: Validators.password(strings),
        ),
        AppTextField(
          controller: confirm,
          hint: strings.confirmPassword,
          prefixIcon: SolarIconsOutline.lock,
          isPassword: true,
          textInputAction: TextInputAction.done,
          validator: Validators.confirmPassword(password, strings),
        ),
      ],
    );
  }
}
