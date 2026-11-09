import 'package:arab_ora_app/core/localization/app_strings.dart';
import '../../core/const/app_images.dart';

class OnboardingItem {
  final String image;
  final String titleStart;
  final String titleEnd;
  final String subtitle;

  const OnboardingItem({
    required this.image,
    required this.titleStart,
    required this.titleEnd,
    required this.subtitle,
  });
}

class OnboardingData {
  OnboardingData._();

  static const List<String> images = [
    AppImages.onboarding1,
    AppImages.onboarding2,
    AppImages.onboarding3,
  ];

  static List<OnboardingItem> items(AppStrings strings) {
    return [
      OnboardingItem(
        image: AppImages.onboarding1,
        titleStart: strings.onboarding1Start,
        titleEnd: strings.onboarding1End,
        subtitle: strings.onboarding1Subtitle,
      ),
      OnboardingItem(
        image: AppImages.onboarding2,
        titleStart: strings.onboarding2Start,
        titleEnd: strings.onboarding2End,
        subtitle: strings.onboarding2Subtitle,
      ),
      OnboardingItem(
        image: AppImages.onboarding3,
        titleStart: strings.onboarding3Start,
        titleEnd: strings.onboarding3End,
        subtitle: strings.onboarding3Subtitle,
      ),
    ];
  }
}
