import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../routes/app_routes.dart';

class OnboardingController extends GetxController {
  final pageController = PageController();
  final currentPage = 0.obs;

  void nextPage() {
    if (currentPage.value < 2) {
      pageController.nextPage(
        duration: Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    } else {
      Get.toNamed(AppRoutes.login);
    }
  }

  void skip() {
    pageController.jumpToPage(2);
  }

  void onPageChanged(int index) {
    currentPage.value = index;
  }
}
