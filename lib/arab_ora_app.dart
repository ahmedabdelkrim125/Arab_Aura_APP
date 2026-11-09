import 'package:flutter/material.dart';
import 'package:arab_ora_app/core/routing/app_router.dart';
import 'package:arab_ora_app/core/utils/responsive_extension.dart';

import 'core/const/app_colors.dart';

class ArabOraApp extends StatelessWidget {
  final Widget home;

  const ArabOraApp({super.key, required this.home});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'عرب اورا',
      theme: ThemeData(
        scaffoldBackgroundColor: AppColors.background,
        colorScheme: ColorScheme.fromSeed(seedColor: AppColors.teal),
      ),
      builder: (context, child) => ResponsiveInit(child: child!),
      onGenerateRoute: AppRouter.onGenerateRoute,
      home: home,
    );
  }
}
