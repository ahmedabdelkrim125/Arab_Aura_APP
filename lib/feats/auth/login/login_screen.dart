import 'package:flutter/material.dart';
import 'package:solar_icons/solar_icons.dart';
import 'package:arab_ora_app/core/localization/app_strings.dart';
import 'package:arab_ora_app/core/routing/app_routes.dart';
import 'package:arab_ora_app/core/theme/app_palette.dart';
import 'package:arab_ora_app/core/utils/responsive_extension.dart';
import 'package:arab_ora_app/core/utils/validators.dart';
import 'package:arab_ora_app/core/widgets/app_button.dart';
import 'package:arab_ora_app/core/widgets/app_text_field.dart';
import 'package:arab_ora_app/core/widgets/fade_slide_in.dart';
import '../../../core/const/app_images.dart';
import '../widgets/auth_footer_link.dart';
import '../widgets/auth_header.dart';
import '../widgets/auth_scaffold.dart';
import '../widgets/email_field.dart';
import 'widgets/login_options_row.dart';
import 'widgets/or_divider.dart';
import 'widgets/social_buttons.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final _email = TextEditingController();
  final _password = TextEditingController();
  bool _remember = false;

  void _submit() {
    FocusScope.of(context).unfocus();
    if (!_formKey.currentState!.validate()) return;
  }

  void _goToSignup() {
    Navigator.of(context).pushReplacementNamed(AppRoutes.roleSelection);
  }

  @override
  void dispose() {
    _email.dispose();
    _password.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final strings = AppStrings.of(context);

    return AuthScaffold(
      children: [
        FadeSlideIn(
          child: SizedBox(
            height: 20.sh,
            child: Center(child: Image.asset(AppImages.logo, height: 120.h)),
          ),
        ),
        FadeSlideIn(
          index: 1,
          child: AuthHeader(
            titleStart: strings.loginTitleStart,
            titleEnd: strings.loginTitleEnd,
            subtitle: strings.loginSubtitle,
          ),
        ),
        SizedBox(height: 24.h),
        FadeSlideIn(
          index: 2,
          child: Form(
            key: _formKey,
            child: Column(
              spacing: 12.h,
              children: [
                EmailField(controller: _email),
                AppTextField(
                  controller: _password,
                  hint: strings.password,
                  prefixIcon: SolarIconsOutline.lock,
                  isPassword: true,
                  textInputAction: TextInputAction.done,
                  autofillHints: const [AutofillHints.password],
                  validator: Validators.notEmpty(strings),
                ),
              ],
            ),
          ),
        ),
        SizedBox(height: 12.h),
        FadeSlideIn(
          index: 3,
          child: LoginOptionsRow(
            remember: _remember,
            onRememberChanged: (value) => setState(() => _remember = value),
          ),
        ),
        SizedBox(height: 16.h),
        FadeSlideIn(
          index: 4,
          child: AppButton(
            label: strings.login,
            trailingIcon: SolarIconsOutline.arrowRight,
            gradient: context.colors.primaryGradient,
            height: 58.h,
            radius: 18.r,
            onPressed: _submit,
          ),
        ),
        SizedBox(height: 18.h),
        const FadeSlideIn(index: 5, child: OrDivider()),
        SizedBox(height: 18.h),
        FadeSlideIn(
          index: 6,
          child: SocialButtons(onApple: () {}, onGoogle: () {}),
        ),
        SizedBox(height: 20.h),
        FadeSlideIn(
          index: 7,
          child: AuthFooterLink(
            text: strings.noAccount,
            linkText: strings.createNewAccount,
            onTap: _goToSignup,
          ),
        ),
        SizedBox(height: 24.h),
      ],
    );
  }
}
