import 'package:flutter/material.dart';

class AppNavigationBar extends StatelessWidget {
  final int currentIndex;
  final ValueChanged<int> onDestinationSelected;
  final List<NavigationDestination>? destinations;

  const AppNavigationBar({
    Key? key,
    required this.currentIndex,
    required this.onDestinationSelected,
    this.destinations,
  }) : super(key: key);

  static const _defaultDestinations = [
    NavigationDestination(
      icon: Icon(Icons.home_outlined),
      selectedIcon: Icon(Icons.home),
      label: 'Home',
    ),
    NavigationDestination(
      icon: Icon(Icons.search_outlined),
      selectedIcon: Icon(Icons.search),
      label: 'Buscar',
    ),
    NavigationDestination(
      icon: Icon(Icons.person_outline),
      selectedIcon: Icon(Icons.person),
      label: 'Perfil',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isWide = MediaQuery.of(context).size.width >= 800;
    final navItems = destinations ?? _defaultDestinations;

    final selectedColor = theme.colorScheme.primary.withOpacity(0.8);
    final unselectedColor = theme.colorScheme.onSurface;

    if (isWide) {
      // Layout com NavigationRail (ideal para desktop)
      return NavigationRail(
        selectedIndex: currentIndex,
        onDestinationSelected: onDestinationSelected,
        labelType: NavigationRailLabelType.all,
        backgroundColor: theme.colorScheme.surface.withOpacity(0.02),
        selectedIconTheme: IconThemeData(color: selectedColor),
        unselectedIconTheme: IconThemeData(color: unselectedColor),
        selectedLabelTextStyle: theme.textTheme.bodySmall!.copyWith(color: selectedColor),
        unselectedLabelTextStyle: theme.textTheme.bodySmall!.copyWith(color: unselectedColor),
        destinations: navItems
            .map(
              (item) => NavigationRailDestination(
            icon: item.icon,
            selectedIcon: item.selectedIcon ?? item.icon,
            label: Text(item.label),
          ),
        )
            .toList(),
      );
    } else {
      // Layout com NavigationBar (mobile/tablet)
      return NavigationBarTheme(
        data: NavigationBarThemeData(
          indicatorColor: selectedColor.withOpacity(0.2),
          backgroundColor: theme.colorScheme.surface.withOpacity(0.02),
          iconTheme: MaterialStateProperty.resolveWith((states) {
            return IconThemeData(
              color: states.contains(MaterialState.selected)
                  ? selectedColor
                  : unselectedColor,
            );
          }),
          labelTextStyle: MaterialStateProperty.resolveWith((states) {
            final baseStyle = theme.textTheme.bodySmall!;
            return baseStyle.copyWith(
              color: states.contains(MaterialState.selected)
                  ? selectedColor
                  : unselectedColor,
            );
          }),
        ),
        child: NavigationBar(
          elevation: 4,
          selectedIndex: currentIndex,
          onDestinationSelected: onDestinationSelected,
          destinations: navItems,
        ),
      );
    }
  }
}
