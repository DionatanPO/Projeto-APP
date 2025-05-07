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
      // Página Home com LayoutBuilder
      LayoutBuilder(
        builder: (context, constraints) {
          final width = constraints.maxWidth;

          int columnCount;
          if (width >= 1200) {
            columnCount = 4;
          } else if (width >= 800) {
            columnCount = 3;
          } else if (width >= 600) {
            columnCount = 2;
          } else {
            columnCount = 1;
          }

          return GridView.builder(
            padding: const EdgeInsets.all(16),
            itemCount: 8,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: columnCount,
              crossAxisSpacing: 16,
              mainAxisSpacing: 16,
              childAspectRatio: 1.5,
            ),
            itemBuilder: (context, index) {
              return Card(
                elevation: 4,
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Card ${index + 1}',
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                      const SizedBox(height: 12),
                      ElevatedButton(
                        onPressed: () {
                          Get.toNamed(AppRoutes.view);
                        },
                        child: const Text('Ver detalhes'),
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        },
      ),

      // Página Buscar
      Center(
        child: Text(
          'Buscar',
          style: Theme.of(context).textTheme.headlineMedium,
        ),
      ),

      // Página Perfil
      Center(
        child: Text(
          'Perfil',
          style: Theme.of(context).textTheme.headlineMedium,
        ),
      ),
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
