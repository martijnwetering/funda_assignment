import 'package:flutter/material.dart';
import 'package:funda_assignment/src/extensions/build_context_extensions.dart';
import 'package:funda_assignment/src/providers/object_detail_provider.dart';
import 'package:provider/provider.dart';

class DetailPageObjectDescription extends StatelessWidget {
  const DetailPageObjectDescription({super.key});

  @override
  Widget build(BuildContext context) {
    final state = context.watch<ObjectDetailProvider>();
    final textTheme = Theme.of(context).textTheme;

    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              context.l10n.description,
              style: textTheme.bodyLarge!.copyWith(
                fontSize: 18,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(height: 10),
            Text(state.object!.volledigeOmschrijving),
          ],
        ),
      ),
    );
  }
}
