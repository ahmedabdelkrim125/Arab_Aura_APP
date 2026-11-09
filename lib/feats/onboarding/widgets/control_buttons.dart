import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:solar_icons/solar_icons.dart';
import 'package:arab_ora_app/core/localization/app_strings.dart';
import 'package:arab_ora_app/core/theme/app_palette.dart';
import 'package:arab_ora_app/core/utils/responsive_extension.dart';
import '../../../core/const/app_text_styles.dart';

class ControlMetrics {
  ControlMetrics._();

  static double get size => 60.w;
  static double get wideWidth => 176.w;
}

class BackCircleButton extends StatelessWidget {
  const BackCircleButton({super.key});

  @override
  Widget build(BuildContext context) {
    final palette = context.colors;

    return Container(
      width: ControlMetrics.size,
      height: ControlMetrics.size,
      decoration: BoxDecoration(shape: BoxShape.circle, color: palette.surface),
      child: Icon(
        SolarIconsOutline.arrowLeft,
        color: palette.textSecondary,
        size: 24.r,
      ),
    );
  }
}

class NextPillButton extends StatelessWidget {
  final double factor;

  const NextPillButton({super.key, required this.factor});

  @override
  Widget build(BuildContext context) {
    final palette = context.colors;
    final width = lerpDouble(
      ControlMetrics.size,
      ControlMetrics.wideWidth,
      factor,
    )!;

    return Container(
      width: width,
      height: ControlMetrics.size,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: palette.primary,
        borderRadius: BorderRadius.circular(40.r),
        boxShadow: [
          BoxShadow(
            color: palette.primary.withValues(alpha: 0.3),
            blurRadius: 18,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          ClipRect(
            child: Align(
              alignment: Alignment.centerRight,
              widthFactor: factor,
              child: Opacity(
                opacity: factor,
                child: Padding(
                  padding: EdgeInsets.only(right: 10.w),
                  child: Text(
                    AppStrings.of(context).startNow,
                    maxLines: 1,
                    softWrap: false,
                    style: AppTextStyles.button(context),
                  ),
                ),
              ),
            ),
          ),
          Icon(
            SolarIconsOutline.arrowRight,
            color: palette.onPrimary,
            size: 26.r,
          ),
        ],
      ),
    );
  }
}
