import 'package:app/core/widgets/app_navigation_bar.dart';
import 'package:app/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controlles/home_controller.dart';

class HomeView extends StatelessWidget {
  final controller = Get.put(HomeController());

  HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final isWide = MediaQuery.of(context).size.width >= 800;

    final pages = [
      Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Home',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            const SizedBox(height: 24),
            ElevatedButton(
              onPressed: () {
                Get.toNamed(AppRoutes.view);
              },
              child: const Text('Ir para Detalhes'),
            ),
          ],
        ),
      ),
      Center(
          child: Text('Buscar',
              style: Theme.of(context).textTheme.headlineMedium)),
      Center(
          child: Text('Perfil',
              style: Theme.of(context).textTheme.headlineMedium)),
    ];

    return Obx(() {
      if (isWide) {
        // Layout desktop/web com NavigationRail
        return Scaffold(
          body: Row(
            children: [
              AppNavigationBar(
                currentIndex: controller.selectedIndex.value,
                onDestinationSelected: controller.changeIndex,
              ),
              const VerticalDivider(width: 1),
              Expanded(child: pages[controller.selectedIndex.value]),
            ],
          ),
        );
      } else {
        // Layout mobile com NavigationBar
        return Scaffold(
          body: pages[controller.selectedIndex.value],
          bottomNavigationBar: AppNavigationBar(
            currentIndex: controller.selectedIndex.value,
            onDestinationSelected: controller.changeIndex,
          ),
        );
      }
    });
  }
}
