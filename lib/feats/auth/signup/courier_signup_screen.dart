import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:arab_ora_app/core/routing/app_routes.dart';
import 'package:arab_ora_app/core/utils/responsive_extension.dart';
import 'package:arab_ora_app/core/utils/validators.dart';
import 'package:arab_ora_app/core/widgets/app_button.dart';
import 'package:arab_ora_app/core/widgets/app_text_field.dart';
import '../../../core/const/app_colors.dart';
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
    return AuthScaffold(
      showBack: true,
      children: [
        SizedBox(height: 8.h),
        const AuthHeader(
          titleStart: 'انضم',
          titleEnd: 'كمندوب توصيل',
          subtitle: 'أكمل بياناتك ومستنداتك لنراجعها ونفعّل حسابك',
        ),
        SizedBox(height: 24.h),
        Form(
          key: _formKey,
          child: Column(
            spacing: 12.h,
            children: [
              AppTextField(
                controller: _name,
                hint: 'الاسم بالكامل',
                prefixIcon: Icons.person_outline_rounded,
                autofillHints: const [AutofillHints.name],
                validator: Validators.notEmpty,
              ),
              EmailField(controller: _email),
              PhoneField(controller: _phone),
              AppTextField(
                controller: _nationalId,
                hint: 'الرقم القومي',
                prefixIcon: Icons.badge_outlined,
                keyboardType: TextInputType.number,
                maxLength: 14,
                inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                validator: Validators.nationalId,
              ),
              AppTextField(
                controller: _city,
                hint: 'المدينة / المنطقة',
                prefixIcon: Icons.location_on_outlined,
                validator: Validators.notEmpty,
              ),
              ChoiceGroup<VehicleType>(
                label: 'نوع المركبة',
                values: VehicleType.values,
                selected: _vehicle,
                labelOf: (vehicle) => vehicle.label,
                onChanged: (vehicle) => setState(() => _vehicle = vehicle),
              ),
              PhotoPickerField(
                label: 'صورة البطاقة (الوجه)',
                icon: Icons.badge_outlined,
              ),
              PhotoPickerField(
                label: 'صورة البطاقة (الظهر)',
                icon: Icons.badge_outlined,
              ),
              PhotoPickerField(
                label: 'صورة شخصية',
                icon: Icons.account_circle_outlined,
              ),
              PasswordFields(password: _password, confirm: _confirm),
              TermsCheckbox(),
            ],
          ),
        ),
        SizedBox(height: 20.h),
        AppButton(
          label: 'إرسال طلب الانضمام',
          trailingIcon: Icons.arrow_forward_rounded,
          gradient: AppColors.primaryGradient,
          height: 58.h,
          radius: 18.r,
          onPressed: _submit,
        ),
        SizedBox(height: 16.h),
        AuthFooterLink(
          text: 'لديك حساب بالفعل؟',
          linkText: 'تسجيل الدخول',
          onTap: _goToLogin,
        ),
        SizedBox(height: 24.h),
      ],
    );
  }
}