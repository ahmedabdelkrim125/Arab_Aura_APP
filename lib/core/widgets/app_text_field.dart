import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:solar_icons/solar_icons.dart';
import 'package:arab_ora_app/core/theme/app_palette.dart';
import 'package:arab_ora_app/core/utils/responsive_extension.dart';

import '../const/app_text_styles.dart';

class AppTextField extends StatefulWidget {
  final TextEditingController? controller;
  final String hint;
  final IconData? prefixIcon;
  final bool isPassword;
  final TextInputType? keyboardType;
  final TextInputAction textInputAction;
  final FormFieldValidator<String>? validator;
  final ValueChanged<String>? onChanged;
  final List<TextInputFormatter>? inputFormatters;
  final Iterable<String>? autofillHints;
  final int? maxLength;
  final int maxLines;
  final bool enabled;

  const AppTextField({
    super.key,
    required this.hint,
    this.controller,
    this.prefixIcon,
    this.isPassword = false,
    this.keyboardType,
    this.textInputAction = TextInputAction.next,
    this.validator,
    this.onChanged,
    this.inputFormatters,
    this.autofillHints,
    this.maxLength,
    this.maxLines = 1,
    this.enabled = true,
  });

  @override
  State<AppTextField> createState() => _AppTextFieldState();
}

class _AppTextFieldState extends State<AppTextField> {
  late bool _obscure = widget.isPassword;

  OutlineInputBorder _border(Color color, [double width = 1]) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(16.r),
      borderSide: BorderSide(color: color, width: width),
    );
  }

  @override
  Widget build(BuildContext context) {
    final palette = context.colors;

    return TextFormField(
      controller: widget.controller,
      obscureText: _obscure,
      keyboardType: widget.keyboardType,
      textInputAction: widget.textInputAction,
      validator: widget.validator,
      onChanged: widget.onChanged,
      inputFormatters: widget.inputFormatters,
      autofillHints: widget.autofillHints,
      maxLength: widget.maxLength,
      maxLines: widget.isPassword ? 1 : widget.maxLines,
      enabled: widget.enabled,
      style: AppTextStyles.fieldText(context),
      cursorColor: palette.accent,
      decoration: InputDecoration(
        hintText: widget.hint,
        hintStyle: AppTextStyles.fieldHint(context),
        counterText: '',
        filled: true,
        fillColor: palette.fieldFill,
        contentPadding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
        prefixIcon: widget.prefixIcon == null
            ? null
            : Icon(widget.prefixIcon, color: palette.textSecondary, size: 22.r),
        suffixIcon: widget.isPassword
            ? _eyeButton(palette.textSecondary)
            : null,
        border: _border(palette.border),
        enabledBorder: _border(palette.border),
        disabledBorder: _border(palette.border),
        focusedBorder: _border(palette.accent, 1.6),
        errorBorder: _border(palette.error),
        focusedErrorBorder: _border(palette.error, 1.6),
        errorStyle: AppTextStyles.fieldError(context),
      ),
    );
  }

  Widget _eyeButton(Color color) {
    return IconButton(
      onPressed: () => setState(() => _obscure = !_obscure),
      icon: Icon(
        _obscure ? SolarIconsOutline.eye : SolarIconsOutline.eyeClosed,
        color: color,
        size: 22.r,
      ),
    );
  }
}
