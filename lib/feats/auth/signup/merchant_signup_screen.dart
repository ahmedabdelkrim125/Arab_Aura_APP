import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:arab_ora_app/core/routing/app_routes.dart';
import 'package:arab_ora_app/core/utils/responsive_extension.dart';
import 'package:arab_ora_app/core/utils/validators.dart';
import 'package:arab_ora_app/core/widgets/app_button.dart';
import 'package:arab_ora_app/core/widgets/app_text_field.dart';
import '../../../core/const/app_colors.dart';
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
    return AuthScaffold(
      showBack: true,
      children: [
        SizedBox(height: 8.h),
        const AuthHeader(
          titleStart: 'سجّل',
          titleEnd: 'كتاجر',
          subtitle: 'أدخل بيانات متجرك لنراجعها ونفعّل حسابك بسرعة',
        ),
        SizedBox(height: 24.h),
        Form(
          key: _formKey,
          child: Column(
            spacing: 12.h,
            children: [
              AppTextField(
                controller: _storeName,
                hint: 'اسم المتجر / البراند',
                prefixIcon: Icons.storefront_outlined,
                validator: Validators.notEmpty,
              ),
              AppTextField(
                controller: _ownerName,
                hint: 'اسم المالك بالكامل',
                prefixIcon: Icons.person_outline_rounded,
                autofillHints: const [AutofillHints.name],
                validator: Validators.notEmpty,
              ),
              EmailField(controller: _email),
              PhoneField(controller: _phone),
              AppTextField(
                controller: _registrationNumber,
                hint: 'رقم السجل التجاري',
                prefixIcon: Icons.receipt_long_outlined,
                keyboardType: TextInputType.number,
                inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                validator: Validators.notEmpty,
              ),
              AppTextField(
                controller: _taxNumber,
                hint: 'الرقم الضريبي (اختياري)',
                prefixIcon: Icons.tag_rounded,
                keyboardType: TextInputType.number,
                inputFormatters: [FilteringTextInputFormatter.digitsOnly],
              ),
              AppTextField(
                controller: _address,
                hint: 'عنوان المتجر',
                prefixIcon: Icons.location_on_outlined,
                validator: Validators.notEmpty,
              ),
              PhotoPickerField(
                label: 'صورة السجل التجاري',
                icon: Icons.description_outlined,
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