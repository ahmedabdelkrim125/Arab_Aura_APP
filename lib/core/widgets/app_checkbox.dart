import 'package:flutter/material.dart';
import 'package:arab_ora_app/core/utils/responsive_extension.dart';
import '../const/app_colors.dart';

class AppCheckbox extends StatelessWidget {
  final bool value;
  final ValueChanged<bool> onChanged;

  const AppCheckbox({super.key, required this.value, required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () => onChanged(!value),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        width: 24.r,
        height: 24.r,
        decoration: BoxDecoration(
          color: value ? AppColors.tealLight : Colors.transparent,
          borderRadius: BorderRadius.circular(7.r),
          border: Border.all(
            color: value ? AppColors.tealLight : AppColors.hint,
            width: 1.5,
          ),
        ),
        child: AnimatedScale(
          scale: value ? 1 : 0,
          duration: const Duration(milliseconds: 200),
          curve: Curves.easeOutBack,
          child: Icon(Icons.check_rounded, size: 18.r, color: Colors.white),
        ),
      ),
    );
  }
}