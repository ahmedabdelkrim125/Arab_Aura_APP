import 'package:flutter/material.dart';
import 'package:arab_ora_app/core/localization/app_strings.dart';

class Validators {
  Validators._();

  static final RegExp _email = RegExp(r'^[\w.+\-]+@([\w\-]+\.)+[\w\-]{2,}$');
  static final RegExp _phone = RegExp(r'^01[0125][0-9]{8}$');
  static final RegExp _nationalId = RegExp(r'^[23][0-9]{13}$');

  static String? _empty(String? value, AppStrings strings) {
    if (value == null || value.trim().isEmpty) return strings.fieldRequired;
    return null;
  }

  static FormFieldValidator<String> notEmpty(AppStrings strings) {
    return (value) => _empty(value, strings);
  }

  static FormFieldValidator<String> email(AppStrings strings) {
    return (value) {
      final empty = _empty(value, strings);
      if (empty != null) return empty;
      return _email.hasMatch(value!.trim()) ? null : strings.invalidEmail;
    };
  }

  static FormFieldValidator<String> phone(AppStrings strings) {
    return (value) {
      final empty = _empty(value, strings);
      if (empty != null) return empty;
      return _phone.hasMatch(value!.trim()) ? null : strings.invalidPhone;
    };
  }

  static FormFieldValidator<String> nationalId(AppStrings strings) {
    return (value) {
      final empty = _empty(value, strings);
      if (empty != null) return empty;
      return _nationalId.hasMatch(value!.trim())
          ? null
          : strings.invalidNationalId;
    };
  }

  static FormFieldValidator<String> password(AppStrings strings) {
    return (value) {
      final empty = _empty(value, strings);
      if (empty != null) return empty;
      return value!.length >= 8 ? null : strings.passwordTooShort;
    };
  }

  static FormFieldValidator<String> confirmPassword(
    TextEditingController password,
    AppStrings strings,
  ) {
    return (value) {
      final empty = _empty(value, strings);
      if (empty != null) return empty;
      return value == password.text ? null : strings.passwordsMismatch;
    };
  }
}
