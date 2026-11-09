import 'package:flutter/material.dart';
import 'package:arab_ora_app/core/utils/responsive_extension.dart';
import '../../../core/const/app_colors.dart';
import 'auth_back_button.dart';

class AuthScaffold extends StatelessWidget {
  final List<Widget> children;
  final bool showBack;

  const AuthScaffold({
    super.key,
    required this.children,
    this.showBack = false,
  });

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: AppColors.background,
        body: SafeArea(
          child: AdaptiveContentWrapper(
            alignment: Alignment.topCenter,
            child: SingleChildScrollView(
              keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
              padding: EdgeInsets.symmetric(horizontal: 24.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  if (showBack) const AuthBackButton(),
                  ...children,
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}