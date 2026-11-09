import 'package:flutter/material.dart';
import 'package:arab_ora_app/core/theme/app_palette.dart';
import 'package:arab_ora_app/core/utils/responsive_extension.dart';
import 'package:arab_ora_app/core/widgets/settings_bar.dart';
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
    return Scaffold(
      backgroundColor: context.colors.background,
      body: SafeArea(
        child: AdaptiveContentWrapper(
          alignment: Alignment.topCenter,
          child: SingleChildScrollView(
            keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
            padding: EdgeInsets.symmetric(horizontal: 24.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 8.h),
                  child: Row(
                    children: [
                      if (showBack) const AuthBackButton(),
                      const Spacer(),
                      const SettingsBar(),
                    ],
                  ),
                ),
                ...children,
              ],
            ),
          ),
        ),
      ),
    );
  }
}
