import 'package:flutter/material.dart';
import 'package:funda_assignment/src/extensions/build_context_extensions.dart';
import 'package:funda_assignment/src/infrastructure/models/search_object.dart';

class SearchResultRow extends StatelessWidget {
  const SearchResultRow({
    super.key,
    required this.object,
    required this.onTap,
  });

  final SearchObject object;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              flex: 2,
              child: SizedBox(
                height: 125,
                child: Image.network(
                  object.fotoLargest,
                  fit: BoxFit.cover,
                  frameBuilder: (context, child, frame, _) {
                    if (frame != null) return child;

                    return const Placeholder();
                  },
                ),
              ),
            ),
            Expanded(
              flex: 4,
              child: _ObjectDescription(
                object: object,
              ),
            )
          ],
        ),
      ),
    );
  }
}

class _ObjectDescription extends StatelessWidget {
  const _ObjectDescription({
    required this.object,
  });

  final SearchObject object;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textStyle = theme.textTheme;

    return Padding(
      padding: const EdgeInsets.all(15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            object.adres,
            style: textStyle.bodyText2!.copyWith(
              color: theme.colorScheme.secondaryContainer,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 4),
          Text('${object.postcode} ${object.woonplaats}'),
          const SizedBox(height: 10),
          Text(
            object.formattedPrice,
            style: textStyle.bodyText2!.copyWith(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 4),
          Text(
            '${object.formattedOppervlakte} \u00b7 '
            '${object.aantalKamers} ${context.l10n.rooms}',
          ),
        ],
      ),
    );
  }
}
