import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:arab_ora_app/core/localization/app_strings.dart';
import 'package:arab_ora_app/core/localization/locale_cubit.dart';
import 'package:arab_ora_app/core/routing/app_router.dart';
import 'package:arab_ora_app/core/theme/app_theme.dart';
import 'package:arab_ora_app/core/theme/theme_cubit.dart';
import 'package:arab_ora_app/core/utils/responsive_extension.dart';

class ArabOraApp extends StatelessWidget {
  final Widget home;

  const ArabOraApp({super.key, required this.home});

  @override
  Widget build(BuildContext context) {
    final themeMode = context.watch<ThemeCubit>().state;
    final locale = context.watch<LocaleCubit>().state;

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      onGenerateTitle: (context) => AppStrings.of(context).appTitle,
      locale: locale,
      supportedLocales: AppStrings.supportedLocales,
      localizationsDelegates: const [
        AppStrings.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      themeMode: themeMode,
      theme: AppTheme.light,
      darkTheme: AppTheme.dark,
      themeAnimationDuration: const Duration(milliseconds: 600),
      themeAnimationCurve: Curves.easeInOut,
      builder: (context, child) => ResponsiveInit(child: child!),
      onGenerateRoute: AppRouter.onGenerateRoute,
      home: home,
    );
  }
}
