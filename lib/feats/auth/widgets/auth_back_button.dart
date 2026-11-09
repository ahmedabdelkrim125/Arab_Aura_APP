import 'package:flutter/material.dart';
import 'package:solar_icons/solar_icons.dart';
import 'package:arab_ora_app/core/theme/app_palette.dart';
import 'package:arab_ora_app/core/utils/responsive_extension.dart';

class AuthBackButton extends StatelessWidget {
  const AuthBackButton({super.key});

  @override
  Widget build(BuildContext context) {
    final palette = context.colors;
    final isRtl = Directionality.of(context) == TextDirection.rtl;

    return IconButton(
      onPressed: () => Navigator.of(context).maybePop(),
      icon: Icon(
        isRtl ? SolarIconsOutline.arrowRight : SolarIconsOutline.arrowLeft,
        size: 24.r,
      ),
      style: IconButton.styleFrom(
        backgroundColor: palette.surface,
        foregroundColor: palette.text,
      ),
    );
  }
}
