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
import '../models/vehicle_type.dart';
import '../widgets/auth_footer_link.dart';
import '../widgets/auth_header.dart';
import '../widgets/auth_scaffold.dart';
import '../widgets/choice_group.dart';
import '../widgets/email_field.dart';
import '../widgets/password_fields.dart';
import '../widgets/phone_field.dart';
import '../widgets/photo_picker_field.dart';
import '../widgets/terms_checkbox.dart';

class CourierSignupScreen extends StatefulWidget {
  const CourierSignupScreen({super.key});

  @override
  State<CourierSignupScreen> createState() => _CourierSignupScreenState();
}

class _CourierSignupScreenState extends State<CourierSignupScreen> {
  final _formKey = GlobalKey<FormState>();
  final _name = TextEditingController();
  final _email = TextEditingController();
  final _phone = TextEditingController();
  final _nationalId = TextEditingController();
  final _city = TextEditingController();
  final _password = TextEditingController();
  final _confirm = TextEditingController();
  VehicleType _vehicle = VehicleType.motorcycle;

  void _submit() {
    FocusScope.of(context).unfocus();
    if (!_formKey.currentState!.validate()) return;
  }

  void _goToLogin() {
    Navigator.of(context).pushReplacementNamed(AppRoutes.login);
  }

  @override
  void dispose() {
    _name.dispose();
    _email.dispose();
    _phone.dispose();
    _nationalId.dispose();
    _city.dispose();
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
          titleStart: strings.courierTitleStart,
          titleEnd: strings.courierTitleEnd,
          subtitle: strings.courierSubtitle,
        ),
        SizedBox(height: 24.h),
        Form(
          key: _formKey,
          child: Column(
            spacing: 12.h,
            children: [
              AppTextField(
                controller: _name,
                hint: strings.fullName,
                prefixIcon: SolarIconsOutline.user,
                autofillHints: const [AutofillHints.name],
                validator: Validators.notEmpty(strings),
              ),
              EmailField(controller: _email),
              PhoneField(controller: _phone),
              AppTextField(
                controller: _nationalId,
                hint: strings.nationalId,
                prefixIcon: SolarIconsOutline.userId,
                keyboardType: TextInputType.number,
                maxLength: 14,
                inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                validator: Validators.nationalId(strings),
              ),
              AppTextField(
                controller: _city,
                hint: strings.city,
                prefixIcon: SolarIconsOutline.mapPoint,
                validator: Validators.notEmpty(strings),
              ),
              ChoiceGroup<VehicleType>(
                label: strings.vehicleType,
                values: VehicleType.values,
                selected: _vehicle,
                labelOf: (vehicle) => vehicle.label(strings),
                onChanged: (vehicle) => setState(() => _vehicle = vehicle),
              ),
              PhotoPickerField(
                label: strings.nationalIdFront,
                icon: SolarIconsOutline.userId,
                requiredMessage: strings.photoRequired,
              ),
              PhotoPickerField(
                label: strings.nationalIdBack,
                icon: SolarIconsOutline.userId,
                requiredMessage: strings.photoRequired,
              ),
              PhotoPickerField(
                label: strings.personalPhoto,
                icon: SolarIconsOutline.userCircle,
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
