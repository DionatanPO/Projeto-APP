import 'package:app/core/widgets/custom_sliver_app_bar.dart';
import 'package:flutter/material.dart';

class View extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isWide = MediaQuery.of(context).size.width >= 800;

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          CustomSliverAppBar(
            title: 'Título',
            subtitle: 'Subtítulo aqui',
            actions: [
              IconButton(
                icon: Icon(Icons.more_vert, color: theme.iconTheme.color),
                onPressed: () => print('Menu tapped'),
                tooltip: 'Mais opções',
              ),
            ],
            backgroundColor: Color.lerp(Colors.white, theme.primaryColor, 0.2),
            expandedHeight: 120,
          ),
          SliverToBoxAdapter(
            child: Center(
              child: ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 700),
                child: ListView.builder(
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: 30,
                  itemBuilder: (context, index) {
                    return ListTile(
                      leading: const Icon(Icons.label),
                      title: Text(
                        'Item ${index + 1}',
                        style: theme.textTheme.bodyMedium,
                      ),
                      subtitle: const Text('Descrição do item'),
                    );
                  },
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
