import 'package:flutter/material.dart';
import 'package:arab_ora_app/core/utils/responsive_extension.dart';
import 'language_toggle_button.dart';
import 'theme_toggle_button.dart';

class SettingsBar extends StatelessWidget {
  const SettingsBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      spacing: 10.w,
      children: const [LanguageToggleButton(), ThemeToggleButton()],
    );
  }
}
