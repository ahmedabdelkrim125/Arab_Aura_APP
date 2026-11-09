import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:solar_icons/solar_icons.dart';
import 'package:arab_ora_app/core/localization/app_strings.dart';
import 'package:arab_ora_app/core/utils/validators.dart';
import 'package:arab_ora_app/core/widgets/app_text_field.dart';

class PhoneField extends StatelessWidget {
  final TextEditingController controller;

  const PhoneField({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    final strings = AppStrings.of(context);

    return AppTextField(
      controller: controller,
      hint: strings.phone,
      prefixIcon: SolarIconsOutline.phone,
      keyboardType: TextInputType.phone,
      maxLength: 11,
      inputFormatters: [FilteringTextInputFormatter.digitsOnly],
      autofillHints: const [AutofillHints.telephoneNumber],
      validator: Validators.phone(strings),
    );
  }
}
