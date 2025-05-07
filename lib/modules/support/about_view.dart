import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:app/core/widgets/custom_sliver_app_bar.dart';

class AboutView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          CustomSliverAppBar(
            title: 'Sobre o app',
            subtitle: 'Versão, autor e detalhes gerais',
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Nome do app",
                    style: theme.textTheme.headlineSmall,
                  ),
                  const SizedBox(height: 8),
                  Text("Versão 1.0.0", style: theme.textTheme.bodyMedium),
                  const SizedBox(height: 24),
                  Text(
                    "Este é um aplicativo genérico desenvolvido em Flutter, ideal para ser usado como base para novos projetos. Ele inclui navegação moderna, tema claro/escuro, estrutura organizada e funcionalidades essenciais.",
                    style: theme.textTheme.bodyMedium,
                  ),
                  const SizedBox(height: 24),
                  Text("Desenvolvido por", style: theme.textTheme.titleMedium),
                  Text("Seu Nome ou Empresa", style: theme.textTheme.bodyLarge),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
