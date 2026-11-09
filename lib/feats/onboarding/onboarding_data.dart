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

  static const List<OnboardingItem> items = [
    OnboardingItem(
      image: AppImages.onboarding1,
      titleStart: 'كل البراندات ..',
      titleEnd: 'في مكان واحد',
      subtitle:
          'اكتشف آلاف المنتجات من أفضل البراندات في تجربة تسوق واحدة وسهلة',
    ),
    OnboardingItem(
      image: AppImages.onboarding2,
      titleStart: 'أشهر البراندات ..',
      titleEnd: 'بين يديك',
      subtitle: 'تسوق من أفضل العلامات التجارية العالمية والمحلية في مكان واحد',
    ),
    OnboardingItem(
      image: AppImages.onboarding3,
      titleStart: 'توصيل سريع ..',
      titleEnd: 'لباب بيتك',
      subtitle: 'اطلب منتجاتك المفضلة من مختلف البراندات واستلمها بسرعة وأمان',
    ),
  ];
}
