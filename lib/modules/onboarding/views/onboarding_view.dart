import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../core/themes/app_colors.dart';
import '../controllers/onboarding_controller.dart';

class OnboardingView extends StatelessWidget {
  final controller = Get.put(OnboardingController());

  final List<Map<String, dynamic>> pages = [
    {
      'title': 'Título 1',
      'desc': 'Descrição genérica da primeira página do onboarding.',
      'image': Icons.info_outline,
    },
    {
      'title': 'Título 2',
      'desc': 'Texto descritivo explicando uma funcionalidade fictícia.',
      'image': Icons.lightbulb_outline,
    },
    {
      'title': 'Título 3',
      'desc': 'Mensagem final incentivando o uso do app.',
      'image': Icons.check_circle_outline,
    },
  ];

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isWide = MediaQuery.of(context).size.width >= 800;

    return Scaffold(
      body: Stack(
        children: [
          // Fundo com gradiente
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  theme.scaffoldBackgroundColor,
                  theme.primaryColor.withOpacity(0.1),
                ],
              ),
            ),
          ),

          // Efeito blur
          BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 15, sigmaY: 15),
            child: Container(
              color: theme.scaffoldBackgroundColor.withOpacity(0.5),
            ),
          ),

          // Conteúdo principal
          Stack(
            children: [
              PageView.builder(
                controller: controller.pageController,
                onPageChanged: controller.onPageChanged,
                itemCount: pages.length,
                itemBuilder: (_, index) {
                  final page = pages[index];
                  return Center(
                    child: ConstrainedBox(
                      constraints: const BoxConstraints(maxWidth: 600),
                      child: Padding(
                        padding: const EdgeInsets.all(32.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              page['image'] as IconData,
                              size: 120,
                              color: theme.primaryColor,
                            ),
                            const SizedBox(height: 40),
                            Text(
                              page['title'] as String,
                              style: theme.textTheme.headlineSmall?.copyWith(
                                fontWeight: FontWeight.bold,
                              ),
                              textAlign: TextAlign.center,
                            ),
                            const SizedBox(height: 20),
                            Text(
                              page['desc'] as String,
                              textAlign: TextAlign.center,
                              style: theme.textTheme.bodyMedium,
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
              Positioned(
                bottom: 60,
                left: 0,
                right: 0,
                child: Center(
                  child: ConstrainedBox(
                    constraints: const BoxConstraints(maxWidth: 600),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 32),
                      child: Column(
                        children: [
                          Obx(() => Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: List.generate(
                              pages.length,
                                  (index) => AnimatedContainer(
                                duration: const Duration(milliseconds: 300),
                                margin: const EdgeInsets.symmetric(horizontal: 6),
                                height: 10,
                                width: controller.currentPage.value == index ? 24 : 10,
                                decoration: BoxDecoration(
                                  color: controller.currentPage.value == index
                                      ? theme.primaryColor
                                      : Colors.grey.withOpacity(0.4),
                                  borderRadius: BorderRadius.circular(20),
                                ),
                              ),
                            ),
                          )),
                          const SizedBox(height: 30),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Obx(() => controller.currentPage.value < pages.length - 1
                                  ? TextButton(
                                onPressed: controller.skip,
                                child: Text(
                                  "Pular",
                                  style: TextStyle(color: theme.primaryColor),
                                ),
                              )
                                  : const SizedBox()),
                              ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: theme.primaryColor,
                                  foregroundColor: AppColors.backgroundLight,
                                ),
                                onPressed: controller.nextPage,
                                child: Obx(() => Text(
                                  controller.currentPage.value == pages.length - 1
                                      ? "Começar"
                                      : "Próximo",
                                )),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
