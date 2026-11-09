import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:arab_ora_app/core/routing/app_routes.dart';
import 'package:arab_ora_app/core/utils/responsive_extension.dart';
import 'onboarding_data.dart';
import 'onboarding_slide.dart';
import 'widgets/onboarding_backdrop.dart';
import 'widgets/onboarding_controls.dart';
import 'widgets/skip_button.dart';

class OnboardingPage extends StatefulWidget {
  const OnboardingPage({super.key});

  @override
  State<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage>
    with SingleTickerProviderStateMixin {
  static const Duration _pageDuration = Duration(milliseconds: 750);
  static const Curve _pageCurve = Curves.easeInOutCubicEmphasized;

  final List<OnboardingItem> _items = OnboardingData.items;
  final PageController _pageController = PageController();
  final ValueNotifier<double> _page = ValueNotifier<double>(0);
  late final AnimationController _idle;
  int _current = 0;

  @override
  void initState() {
    super.initState();
    _idle = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 4),
    )..repeat();
    _pageController.addListener(_onScroll);
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    for (final item in _items) {
      precacheImage(AssetImage(item.image), context);
    }
  }

  void _onScroll() {
    _page.value = _pageController.page ?? 0;
  }

  void _onPageChanged(int index) {
    _current = index;
    HapticFeedback.selectionClick();
  }

  void _next() {
    if (_current >= _items.length - 1) {
      _finish();
      return;
    }
    _pageController.nextPage(duration: _pageDuration, curve: _pageCurve);
  }

  void _back() {
    if (_current <= 0) return;
    _pageController.previousPage(duration: _pageDuration, curve: _pageCurve);
  }

  void _finish() {
    Navigator.of(context).pushReplacementNamed(AppRoutes.roleSelection);
  }

  @override
  void dispose() {
    _pageController.removeListener(_onScroll);
    _pageController.dispose();
    _page.dispose();
    _idle.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: OnboardingBackdrop(
              page: _page,
              idle: _idle,
              count: _items.length,
            ),
          ),
          SafeArea(
            child: AdaptiveContentWrapper(
              alignment: Alignment.center,
              child: Stack(
                fit: StackFit.expand,
                children: [
                  PageView.builder(
                    controller: _pageController,
                    physics: const ClampingScrollPhysics(),
                    itemCount: _items.length,
                    onPageChanged: _onPageChanged,
                    itemBuilder: (context, index) => OnboardingSlide(
                      item: _items[index],
                      index: index,
                      page: _page,
                      idle: _idle,
                      bottomInset: 130.h,
                    ),
                  ),
                  Align(
                    alignment: Alignment.topRight,
                    child: Padding(
                      padding: EdgeInsets.only(top: 12.h, right: 20.w),
                      child: SkipButton(onTap: _finish),
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Padding(
                      padding: EdgeInsets.fromLTRB(20.w, 0, 20.w, 28.h),
                      child: OnboardingControls(
                        page: _page,
                        count: _items.length,
                        onNext: _next,
                        onBack: _back,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
