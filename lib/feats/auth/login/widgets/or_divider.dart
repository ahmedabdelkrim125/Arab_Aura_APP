import 'package:flutter/material.dart';
import 'package:arab_ora_app/core/localization/app_strings.dart';
import 'package:arab_ora_app/core/theme/app_palette.dart';
import 'package:arab_ora_app/core/utils/responsive_extension.dart';
import '../../../../core/const/app_text_styles.dart';

class OrDivider extends StatelessWidget {
  const OrDivider({super.key});

  @override
  Widget build(BuildContext context) {
    final color = context.colors.border;

    return Row(
      spacing: 12.w,
      children: [
        Expanded(child: Divider(color: color, thickness: 1, height: 1)),
        Text(AppStrings.of(context).or, style: AppTextStyles.caption(context)),
        Expanded(child: Divider(color: color, thickness: 1, height: 1)),
      ],
    );
  }
}
