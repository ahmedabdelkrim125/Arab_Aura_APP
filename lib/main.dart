import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:arab_ora_app/arab_ora_app.dart';
import 'package:arab_ora_app/core/localization/locale_cubit.dart';
import 'package:arab_ora_app/core/theme/theme_cubit.dart';
import 'feats/splash/splash_page.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final prefs = await SharedPreferences.getInstance();

  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider<ThemeCubit>(create: (_) => ThemeCubit(prefs)),
        BlocProvider<LocaleCubit>(create: (_) => LocaleCubit(prefs)),
      ],
      child: const ArabOraApp(home: SplashPage()),
    ),
  );
}
