import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeCubit extends Cubit<ThemeMode> {
  ThemeCubit(this._prefs) : super(_read(_prefs));

  static const String _key = 'theme_mode';

  final SharedPreferences _prefs;

  static ThemeMode _read(SharedPreferences prefs) {
    return prefs.getString(_key) == 'dark' ? ThemeMode.dark : ThemeMode.light;
  }

  bool get isDark => state == ThemeMode.dark;

  Future<void> toggle() async {
    final next = isDark ? ThemeMode.light : ThemeMode.dark;
    emit(next);
    await _prefs.setString(_key, next == ThemeMode.dark ? 'dark' : 'light');
  }
}
