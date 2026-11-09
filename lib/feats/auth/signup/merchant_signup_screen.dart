import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:solar_icons/solar_icons.dart';
import 'package:arab_ora_app/core/localization/app_strings.dart';
import 'package:arab_ora_app/core/routing/app_routes.dart';
import 'package:arab_ora_app/core/theme/app_palette.dart';
import 'package:arab_ora_app/core/utils/responsive_extension.dart';
import 'package:arab_ora_app/core/utils/validators.dart';
import 'package:arab_ora_app/core/widgets/app_button.dart';
import 'package:arab_ora_app/core/widgets/app_text_field.dart';
import '../widgets/auth_footer_link.dart';
import '../widgets/auth_header.dart';
import '../widgets/auth_scaffold.dart';
import '../widgets/email_field.dart';
import '../widgets/password_fields.dart';
import '../widgets/phone_field.dart';
import '../widgets/photo_picker_field.dart';
import '../widgets/terms_checkbox.dart';

class MerchantSignupScreen extends StatefulWidget {
  const MerchantSignupScreen({super.key});

  @override
  State<MerchantSignupScreen> createState() => _MerchantSignupScreenState();
}

class _MerchantSignupScreenState extends State<MerchantSignupScreen> {
  final _formKey = GlobalKey<FormState>();
  final _storeName = TextEditingController();
  final _ownerName = TextEditingController();
  final _email = TextEditingController();
  final _phone = TextEditingController();
  final _registrationNumber = TextEditingController();
  final _taxNumber = TextEditingController();
  final _address = TextEditingController();
  final _password = TextEditingController();
  final _confirm = TextEditingController();

  void _submit() {
    FocusScope.of(context).unfocus();
    if (!_formKey.currentState!.validate()) return;
  }

  void _goToLogin() {
    Navigator.of(context).pushReplacementNamed(AppRoutes.login);
  }

  @override
  void dispose() {
    _storeName.dispose();
    _ownerName.dispose();
    _email.dispose();
    _phone.dispose();
    _registrationNumber.dispose();
    _taxNumber.dispose();
    _address.dispose();
    _password.dispose();
    _confirm.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final strings = AppStrings.of(context);

    return AuthScaffold(
      showBack: true,
      children: [
        SizedBox(height: 8.h),
        AuthHeader(
          titleStart: strings.merchantTitleStart,
          titleEnd: strings.merchantTitleEnd,
          subtitle: strings.merchantSubtitle,
        ),
        SizedBox(height: 24.h),
        Form(
          key: _formKey,
          child: Column(
            spacing: 12.h,
            children: [
              AppTextField(
                controller: _storeName,
                hint: strings.storeName,
                prefixIcon: SolarIconsOutline.shop,
                validator: Validators.notEmpty(strings),
              ),
              AppTextField(
                controller: _ownerName,
                hint: strings.ownerName,
                prefixIcon: SolarIconsOutline.user,
                autofillHints: const [AutofillHints.name],
                validator: Validators.notEmpty(strings),
              ),
              EmailField(controller: _email),
              PhoneField(controller: _phone),
              AppTextField(
                controller: _registrationNumber,
                hint: strings.commercialRegister,
                prefixIcon: SolarIconsOutline.bill,
                keyboardType: TextInputType.number,
                inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                validator: Validators.notEmpty(strings),
              ),
              AppTextField(
                controller: _taxNumber,
                hint: strings.taxNumber,
                prefixIcon: SolarIconsOutline.hashtag,
                keyboardType: TextInputType.number,
                inputFormatters: [FilteringTextInputFormatter.digitsOnly],
              ),
              AppTextField(
                controller: _address,
                hint: strings.storeAddress,
                prefixIcon: SolarIconsOutline.mapPoint,
                validator: Validators.notEmpty(strings),
              ),
              PhotoPickerField(
                label: strings.commercialRegisterPhoto,
                icon: SolarIconsOutline.document,
                requiredMessage: strings.photoRequired,
              ),
              PasswordFields(password: _password, confirm: _confirm),
              TermsCheckbox(requiredMessage: strings.termsRequired),
            ],
          ),
        ),
        SizedBox(height: 20.h),
        AppButton(
          label: strings.submitJoinRequest,
          trailingIcon: SolarIconsOutline.arrowRight,
          gradient: context.colors.primaryGradient,
          height: 58.h,
          radius: 18.r,
          onPressed: _submit,
        ),
        SizedBox(height: 16.h),
        AuthFooterLink(
          text: strings.haveAccount,
          linkText: strings.login,
          onTap: _goToLogin,
        ),
        SizedBox(height: 24.h),
      ],
    );
  }
}
