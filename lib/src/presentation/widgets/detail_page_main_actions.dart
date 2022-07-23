import 'package:flutter/material.dart';
import 'package:funda_assignment/src/extensions/build_context_extensions.dart';

class DetailPageMainActions extends StatelessWidget {
  const DetailPageMainActions({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Row(
        children: [
          _ActionButton(
            icon: Icons.map_outlined,
            text: context.l10n.floorPlan,
          ),
          _ActionButton(
            icon: Icons.threesixty_outlined,
            text: context.l10n.threesixty,
          ),
          _ActionButton(
            icon: Icons.play_arrow_outlined,
            text: context.l10n.video,
          ),
        ],
      ),
    );
  }
}

class _ActionButton extends StatelessWidget {
  const _ActionButton({
    required this.icon,
    required this.text,
  });

  final IconData icon;
  final String text;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Expanded(
      child: Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          border: Border.all(color: theme.colorScheme.secondary, width: 0.5),
        ),
        child: Column(
          children: [
            Icon(
              icon,
              size: 50,
              color: theme.colorScheme.secondaryContainer,
            ),
            const SizedBox(height: 5),
            Text(
              text,
              style: theme.textTheme.bodyText2!.copyWith(
                color: theme.colorScheme.secondaryContainer,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
