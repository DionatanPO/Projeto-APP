import 'package:app/core/widgets/custom_sliver_app_bar.dart';
import 'package:app/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HelpView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isWide = MediaQuery.of(context).size.width >= 800;

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          CustomSliverAppBar(
            title: 'Ajuda',
            subtitle: 'Encontre respostas ou fale conosco',
            actions: [
              IconButton(
                icon: Icon(Icons.support_agent, color: theme.iconTheme.color),
                onPressed: () {
                  print('Contato com suporte');
                },
                tooltip: 'Contato com suporte',
              ),
            ],
          ),
          SliverToBoxAdapter(
            child: Center(
              child: ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 700),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Column(
                    children: [
                      const SizedBox(height: 16),
                      _buildHelpItem(
                        context,
                        icon: Icons.lock_outline,
                        title: 'Privacidade e Segurança',
                        subtitle: 'Gerencie suas permissões e dados.',
                      ),
                      _buildHelpItem(
                        context,
                        icon: Icons.notifications_outlined,
                        title: 'Notificações',
                        subtitle: 'Saiba como controlar os alertas.',
                      ),
                      _buildHelpItem(
                        context,
                        icon: Icons.contact_support_outlined,
                        title: 'Falar com o suporte',
                        subtitle: 'Entre em contato com nossa equipe.',
                        onTap: () {
                          Get.snackbar("Suporte", "Função de contato será implementada.");
                        },
                      ),
                      _buildHelpItem(
                        context,
                        icon: Icons.info_outline,
                        title: 'Sobre o app',
                        subtitle: 'Informações da versão e desenvolvedor.',
                        onTap: () {
                          Get.toNamed(AppRoutes.about);
                        },
                      ),
                      const SizedBox(height: 24),
                      TextButton.icon(
                        onPressed: () {
                          Get.snackbar("Email enviado", "Entraremos em contato em breve!");
                        },
                        icon: const Icon(Icons.email_outlined),
                        label: const Text("Enviar um e-mail"),
                      ),
                      const SizedBox(height: 32),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildHelpItem(
      BuildContext context, {
        required IconData icon,
        required String title,
        required String subtitle,
        VoidCallback? onTap,
      }) {
    final theme = Theme.of(context);
    return ListTile(
      contentPadding: const EdgeInsets.symmetric(vertical: 4),
      leading: Icon(icon, color: theme.colorScheme.primary),
      title: Text(title, style: theme.textTheme.bodyLarge),
      subtitle: Text(subtitle),
      trailing: const Icon(Icons.chevron_right),
      onTap: onTap ?? () {},
    );
  }
}
