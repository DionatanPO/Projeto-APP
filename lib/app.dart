import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'core/themes/app_theme.dart';
import 'routes/app_pages.dart';
import 'routes/app_routes.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Seu App',
      theme: AppTheme.light,
      darkTheme: AppTheme.dark,
      themeMode: ThemeMode.system,
      initialRoute: AppRoutes.onboarding,
      getPages: AppPages.pages,
    );
  }
}
