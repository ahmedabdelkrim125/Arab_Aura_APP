import 'package:flutter/material.dart';
import 'package:solar_icons/solar_icons.dart';
import 'package:arab_ora_app/core/localization/app_strings.dart';
import 'package:arab_ora_app/core/utils/validators.dart';
import 'package:arab_ora_app/core/widgets/app_text_field.dart';

class EmailField extends StatelessWidget {
  final TextEditingController controller;

  const EmailField({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    final strings = AppStrings.of(context);

    return AppTextField(
      controller: controller,
      hint: strings.email,
      prefixIcon: SolarIconsOutline.letter,
      keyboardType: TextInputType.emailAddress,
      autofillHints: const [AutofillHints.email],
      validator: Validators.email(strings),
    );
  }
}
