import 'package:flutter/material.dart';

class Validators {
  Validators._();

  static final RegExp _email = RegExp(r'^[\w.+\-]+@([\w\-]+\.)+[\w\-]{2,}$');
  static final RegExp _phone = RegExp(r'^01[0125][0-9]{8}$');
  static final RegExp _nationalId = RegExp(r'^[23][0-9]{13}$');

  static String? notEmpty(String? value) {
    if (value == null || value.trim().isEmpty) return 'هذا الحقل مطلوب';
    return null;
  }

  static String? email(String? value) {
    final empty = notEmpty(value);
    if (empty != null) return empty;
    return _email.hasMatch(value!.trim()) ? null : 'البريد الإلكتروني غير صحيح';
  }

  static String? phone(String? value) {
    final empty = notEmpty(value);
    if (empty != null) return empty;
    return _phone.hasMatch(value!.trim()) ? null : 'رقم الهاتف غير صحيح';
  }

  static String? nationalId(String? value) {
    final empty = notEmpty(value);
    if (empty != null) return empty;
    return _nationalId.hasMatch(value!.trim())
        ? null
        : 'الرقم القومي يجب أن يكون 14 رقماً صحيحاً';
  }

  static String? password(String? value) {
    final empty = notEmpty(value);
    if (empty != null) return empty;
    return value!.length >= 8 ? null : 'كلمة المرور يجب ألا تقل عن 8 أحرف';
  }

  static FormFieldValidator<String> confirmPassword(
    TextEditingController password,
  ) {
    return (value) {
      final empty = notEmpty(value);
      if (empty != null) return empty;
      return value == password.text ? null : 'كلمتا المرور غير متطابقتين';
    };
  }
}