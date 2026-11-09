import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocaleCubit extends Cubit<Locale> {
  LocaleCubit(this._prefs) : super(_read(_prefs));

  static const String _key = 'language_code';

  final SharedPreferences _prefs;

  static Locale _read(SharedPreferences prefs) {
    return Locale(prefs.getString(_key) == 'en' ? 'en' : 'ar');
  }

  bool get isArabic => state.languageCode == 'ar';

  Future<void> toggle() async {
    final next = Locale(isArabic ? 'en' : 'ar');
    emit(next);
    await _prefs.setString(_key, next.languageCode);
  }
}
