import 'package:app/modules/auth/login/login_view.dart';
import 'package:app/modules/auth/register/register_view.dart';
import 'package:app/modules/functions/view.dart';
import 'package:app/modules/home/bindings/home_binding.dart';
import 'package:app/modules/home/views/home_view.dart';
import 'package:app/modules/onboarding/bindings/onboarding_binding.dart';
import 'package:app/modules/onboarding/views/onboarding_view.dart';
import 'package:app/modules/support/about_view.dart';
import 'package:app/modules/support/help_view.dart';
import 'package:get/get.dart';

import '../modules/dashboard/bindings/dhasboard_binding.dart';
import '../modules/dashboard/views/dashboard_view.dart';
import 'app_routes.dart';

class AppPages {
  static final pages = [
    GetPage(
      name: AppRoutes.onboarding,
      page: () => OnboardingView(),
      binding: OnboardingBinding(),
    ),
    GetPage(
      name: AppRoutes.home,
      page: () => HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: AppRoutes.DASHBOARD,
      page: () => DashboardView(),
      binding: DashboardBinding(),
    ),
    GetPage(
      name: AppRoutes.view,
      page: () => View(),
      binding: null,
    ),
    GetPage(
      name: AppRoutes.help,
      page: () => HelpView(),
      binding: null,
    ),
    GetPage(
      name: AppRoutes.about,
      page: () => AboutView(),
      binding: null,
    ),
    GetPage(
      name: AppRoutes.login,
      page: () => LoginView(),
      binding: null,
    ),
    GetPage(
      name: AppRoutes.register,
      page: () => RegisterView(),
      binding: null,
    ),
  ];
}
