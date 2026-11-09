import 'package:flutter/material.dart';
import 'package:arab_ora_app/core/utils/responsive_extension.dart';
import '../../../../core/const/app_colors.dart';
import '../../../../core/const/app_text_styles.dart';

class OrDivider extends StatelessWidget {
  const OrDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 12.w,
      children: [
        const Expanded(
          child: Divider(color: AppColors.border, thickness: 1, height: 1),
        ),
        Text('أو', style: AppTextStyles.caption),
        const Expanded(
          child: Divider(color: AppColors.border, thickness: 1, height: 1),
        ),
      ],
    );
  }
}