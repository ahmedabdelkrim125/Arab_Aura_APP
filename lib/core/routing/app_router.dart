import 'package:arab_ora_app/feats/auth/signup/customer_signup_screen.dart';
import 'package:flutter/material.dart';
import 'package:arab_ora_app/core/routing/app_routes.dart';
import '../../feats/auth/login/login_screen.dart';
import '../../feats/auth/role_selection/widgets/role_selection_screen.dart';
import '../../feats/auth/signup/courier_signup_screen.dart';
import '../../feats/auth/signup/merchant_signup_screen.dart';
import '../../feats/onboarding/onboarding_page.dart';
import '../../feats/splash/splash_page.dart';

class AppRouter {
  AppRouter._();

  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppRoutes.onboarding:
        return _fade(const OnboardingPage(), settings);
      case AppRoutes.roleSelection:
        return _slideFade(const RoleSelectionScreen(), settings);
      case AppRoutes.login:
        return _slideFade(const LoginScreen(), settings);
      case AppRoutes.customerSignup:
        return _slideFade(const CustomerSignupScreen(), settings);
      case AppRoutes.merchantSignup:
        return _slideFade(const MerchantSignupScreen(), settings);
      case AppRoutes.courierSignup:
        return _slideFade(const CourierSignupScreen(), settings);
      case AppRoutes.splash:
      default:
        return _fade(const SplashPage(), settings);
    }
  }

  static PageRoute<dynamic> _fade(Widget page, RouteSettings settings) {
    return PageRouteBuilder<dynamic>(
      settings: settings,
      transitionDuration: const Duration(milliseconds: 600),
      pageBuilder: (context, animation, secondaryAnimation) => page,
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        return FadeTransition(opacity: animation, child: child);
      },
    );
  }

  static PageRoute<dynamic> _slideFade(Widget page, RouteSettings settings) {
    final curve = CurveTween(curve: Curves.easeOutCubic);
    final offset = Tween<Offset>(
      begin: const Offset(0, 0.06),
      end: Offset.zero,
    );

    return PageRouteBuilder<dynamic>(
      settings: settings,
      transitionDuration: const Duration(milliseconds: 450),
      pageBuilder: (context, animation, secondaryAnimation) => page,
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        return FadeTransition(
          opacity: animation.drive(curve),
          child: SlideTransition(
            position: animation.drive(offset.chain(curve)),
            child: child,
          ),
        );
      },
    );
  }
}
