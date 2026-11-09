import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:arab_ora_app/core/routing/app_routes.dart';
import 'package:arab_ora_app/core/utils/responsive_extension.dart';
import 'package:arab_ora_app/core/widgets/app_button.dart';
import 'package:arab_ora_app/core/widgets/fade_slide_in.dart';
import '../../models/user_role.dart';
import '../../widgets/auth_footer_link.dart';
import '../../widgets/auth_header.dart';
import '../../widgets/auth_scaffold.dart';
import 'role_card.dart';

class RoleSelectionScreen extends StatefulWidget {
  const RoleSelectionScreen({super.key});

  @override
  State<RoleSelectionScreen> createState() => _RoleSelectionScreenState();
}

class _RoleSelectionScreenState extends State<RoleSelectionScreen> {
  UserRole _selected = UserRole.customer;

  void _select(UserRole role) {
    if (role == _selected) return;
    HapticFeedback.selectionClick();
    setState(() => _selected = role);
  }

  void _join() {
    Navigator.of(context).pushNamed(_selected.signupRoute);
  }

  void _goToLogin() {
    Navigator.of(context).pushReplacementNamed(AppRoutes.login);
  }

  @override
  Widget build(BuildContext context) {
    return AuthScaffold(
      children: [
        SizedBox(height: 4.sh),
        const FadeSlideIn(
          child: AuthHeader(
            titleStart: 'زائرنا',
            titleEnd: 'الكريم!',
            subtitle:
                'استكشف الأدوار المتاحة وانضم إلينا في عرب أورا واختر ما يناسبك للبدء',
          ),
        ),
        SizedBox(height: 28.h),
        for (var i = 0; i < UserRole.values.length; i++)
          Padding(
            padding: EdgeInsets.only(bottom: 14.h),
            child: FadeSlideIn(
              index: i + 1,
              child: RoleCard(
                role: UserRole.values[i],
                selected: _selected == UserRole.values[i],
                onTap: () => _select(UserRole.values[i]),
              ),
            ),
          ),
        SizedBox(height: 10.h),
        FadeSlideIn(
          index: 4,
          child: AppButton(
            label: 'انضم إلينا الآن',
            trailingIcon: Icons.arrow_forward_rounded,
            height: 58.h,
            radius: 18.r,
            onPressed: _join,
          ),
        ),
        SizedBox(height: 16.h),
        FadeSlideIn(
          index: 5,
          child: AuthFooterLink(
            text: 'لديك حساب بالفعل؟',
            linkText: 'تسجيل الدخول',
            onTap: _goToLogin,
          ),
        ),
        SizedBox(height: 24.h),
      ],
    );
  }
}