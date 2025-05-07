import 'package:app/core/themes/app_colors.dart';
import 'package:flutter/material.dart';

class CustomSliverAppBar extends StatelessWidget {
  final String title;
  final String? subtitle;
  final List<Widget>? actions;
  final Color? backgroundColor;
  final double expandedHeight;

  const CustomSliverAppBar({
    Key? key,
    required this.title,
    this.subtitle,
    this.actions,
    this.backgroundColor,
    this.expandedHeight = 100,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return SliverAppBar(
      pinned: true,
      backgroundColor:
          backgroundColor ?? Color.lerp(Colors.white, theme.primaryColor, 0.15),
      expandedHeight: expandedHeight,
      elevation: 4,
      scrolledUnderElevation: 10,
      leading: IconButton(
        icon: Icon(Icons.arrow_back, color: theme.iconTheme.color),
        onPressed: () => Navigator.maybePop(context),
        tooltip: 'Voltar',
      ),
      actions: actions,
      flexibleSpace: FlexibleSpaceBar(
        background: Container(
          color: backgroundColor ??
              Color.lerp(Colors.white, theme.primaryColor, 0.15),
        ),
        centerTitle: false,
        titlePadding: const EdgeInsets.only(left: 56, bottom: 16, top: 16),
        title: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            MediaQuery(
              data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
              child: Text(
                title,
                style: theme.textTheme.titleSmall?.copyWith(
                  fontWeight: FontWeight.w700,
                  color: AppColors.textDark,
                ),
              ),
            ),

            if (subtitle != null) ...[
              const SizedBox(height: 4),
              MediaQuery(
                data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
                child: Text(
                  subtitle!,
                  style: theme.textTheme.labelSmall?.copyWith(
                    color: AppColors.textDark.withOpacity(0.8),
                  ),
                ),
              ),
            ],

          ],
        ),
      ),
    );
  }
}
