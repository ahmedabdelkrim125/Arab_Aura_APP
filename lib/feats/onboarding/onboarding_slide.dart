import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:arab_ora_app/core/const/app_text_styles.dart';
import 'package:arab_ora_app/core/utils/responsive_extension.dart';
import 'onboarding_data.dart';
import 'widgets/onboarding_illustration.dart';
import 'widgets/onboarding_title.dart';

class OnboardingSlide extends StatelessWidget {
  final OnboardingItem item;
  final int index;
  final ValueListenable<double> page;
  final Animation<double> idle;
  final double bottomInset;

  const OnboardingSlide({
    super.key,
    required this.item,
    required this.index,
    required this.page,
    required this.idle,
    required this.bottomInset,
  });

  @override
  Widget build(BuildContext context) {
    final direction = Directionality.of(context) == TextDirection.rtl
        ? -1.0
        : 1.0;

    return LayoutBuilder(
      builder: (context, constraints) {
        final width = constraints.maxWidth;
        return ValueListenableBuilder<double>(
          valueListenable: page,
          builder: (context, value, _) {
            final delta = (index - value).clamp(-1.0, 1.0);
            final active = 1 - delta.abs();
            return Padding(
              padding: EdgeInsets.fromLTRB(24.w, 64.h, 24.w, bottomInset),
              child: Column(
                children: [
                  Expanded(
                    flex: 6,
                    child: _illustration(delta, width, direction),
                  ),
                  SizedBox(height: 20.h),
                  _texts(context, delta, active, width, direction),
                  const Spacer(),
                ],
              ),
            );
          },
        );
      },
    );
  }

  Widget _illustration(double delta, double width, double direction) {
    return Opacity(
      opacity: (1 - delta.abs() * 1.3).clamp(0.0, 1.0),
      child: Transform.translate(
        offset: Offset(direction * delta * width * 0.45, 0),
        child: Transform.scale(
          scale: 1 - delta.abs() * 0.3,
          child: Transform(
            alignment: Alignment.center,
            transform: Matrix4.identity()
              ..setEntry(3, 2, 0.0012)
              ..rotateY(-direction * delta * 0.9)
              ..rotateZ(direction * delta * 0.12),
            child: OnboardingIllustration(image: item.image, idle: idle),
          ),
        ),
      ),
    );
  }

  Widget _texts(
    BuildContext context,
    double delta,
    double active,
    double width,
    double direction,
  ) {
    final subtitle = Curves.easeOut.transform(
      ((active - 0.5) / 0.5).clamp(0.0, 1.0),
    );

    return Transform.translate(
      offset: Offset(-direction * delta * width * 0.35, 0),
      child: Column(
        children: [
          OnboardingTitle(
            start: item.titleStart,
            end: item.titleEnd,
            progress: active,
          ),
          SizedBox(height: 14.h),
          Opacity(
            opacity: subtitle,
            child: Transform.translate(
              offset: Offset(0, (1 - subtitle) * 20.h),
              child: Text(
                item.subtitle,
                textAlign: TextAlign.center,
                style: AppTextStyles.onboardingSubtitle(context),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
