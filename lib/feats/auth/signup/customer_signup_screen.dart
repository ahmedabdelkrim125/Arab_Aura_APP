import 'package:flutter/material.dart';
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
import '../widgets/terms_checkbox.dart';

class CustomerSignupScreen extends StatefulWidget {
  const CustomerSignupScreen({super.key});

  @override
  State<CustomerSignupScreen> createState() => _CustomerSignupScreenState();
}

class _CustomerSignupScreenState extends State<CustomerSignupScreen> {
  final _formKey = GlobalKey<FormState>();
  final _name = TextEditingController();
  final _email = TextEditingController();
  final _phone = TextEditingController();
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
    _name.dispose();
    _email.dispose();
    _phone.dispose();
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
          titleStart: 'إنشاء',
          titleEnd: 'حساب جديد',
          subtitle: 'سجّل بياناتك وابدأ التسوق من أفضل البراندات',
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
              PasswordFields(password: _password, confirm: _confirm),
              TermsCheckbox(),
            ],
          ),
        ),
        SizedBox(height: 20.h),
        AppButton(
          label: 'إنشاء الحساب',
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