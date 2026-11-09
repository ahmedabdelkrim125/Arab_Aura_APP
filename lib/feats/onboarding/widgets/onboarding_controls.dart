import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:arab_ora_app/core/utils/responsive_extension.dart';

import 'control_buttons.dart';
import 'onboarding_track.dart';
import 'press_scale.dart';

class OnboardingControls extends StatelessWidget {
  final ValueListenable<double> page;
  final int count;
  final VoidCallback onNext;
  final VoidCallback onBack;

  const OnboardingControls({
    super.key,
    required this.page,
    required this.count,
    required this.onNext,
    required this.onBack,
  });

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.ltr,
      child: ValueListenableBuilder<double>(
        valueListenable: page,
        builder: (context, value, _) {
          final backFactor = value.clamp(0.0, 1.0);
          final lastFactor = (value - (count - 2)).clamp(0.0, 1.0);

          return SizedBox(
            height: ControlMetrics.size,
            child: Row(
              children: [
                ClipRect(
                  child: Align(
                    alignment: Alignment.centerLeft,
                    widthFactor: backFactor,
                    child: Opacity(
                      opacity: backFactor,
                      child: Padding(
                        padding: EdgeInsets.only(right: 12.w),
                        child: PressScale(
                          onTap: onBack,
                          child: const BackCircleButton(),
                        ),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: OnboardingTrack(page: page, count: count),
                ),
                SizedBox(width: 12.w),
                PressScale(
                  onTap: onNext,
                  child: NextPillButton(factor: lastFactor),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
