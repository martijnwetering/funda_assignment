import 'package:flutter/material.dart';
import 'package:funda_assignment/src/providers/object_detail_provider.dart';
import 'package:provider/provider.dart';

class DetailPageObjectInfo extends StatelessWidget {
  const DetailPageObjectInfo({super.key});

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
              state.adres,
              style: textTheme.headlineSmall!.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 3),
            Text(
              '${state.postcode} ${state.plaats}',
              style: textTheme.bodyMedium!.copyWith(color: Colors.grey),
            ),
            const SizedBox(height: 5),
            Text(
              state.formattedOppervlakte,
              style: textTheme.bodyLarge,
            ),
            const SizedBox(height: 3),
            Text(
              state.formattedPrice,
              style: textTheme.bodyLarge!.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
