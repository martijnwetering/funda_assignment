import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:funda_assignment/src/providers/object_detail_provider.dart';
import 'package:provider/provider.dart';

class DetailPageAppBar extends StatelessWidget {
  const DetailPageAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    final state = context.watch<ObjectDetailProvider>();
    final theme = Theme.of(context);

    return SliverAppBar(
      expandedHeight: 240,
      systemOverlayStyle: SystemUiOverlayStyle.light,
      foregroundColor: Colors.white,
      pinned: true,
      backgroundColor: theme.colorScheme.primary,
      actions: [
        IconButton(
          onPressed: () {},
          icon: const Icon(Icons.share, color: Colors.white),
        ),
        IconButton(
          onPressed: () {},
          icon: const Icon(Icons.favorite_outline, color: Colors.white),
        ),
      ],
      flexibleSpace: FlexibleSpaceBar(
        background: DecoratedBox(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: Image.network(state.hoofdFoto).image,
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
    );
  }
}
