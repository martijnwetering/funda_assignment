import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:funda_assignment/src/extensions/build_context_extensions.dart';
import 'package:funda_assignment/src/providers/object_detail_provider.dart';
import 'package:provider/provider.dart';

class DetailPage extends StatefulWidget {
  const DetailPage({super.key});

  static const route = '/detail';

  @override
  State<DetailPage> createState() => _DetailPageState();
}

Widget get _loadingSpinner => const Scaffold(
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );

class _DetailPageState extends State<DetailPage> {
  @override
  Widget build(BuildContext context) {
    final state = context.watch<ObjectDetailProvider>();
    final theme = Theme.of(context);

    if (state.loading) return _loadingSpinner;

    if (state.object == null) return Scaffold(body: const SizedBox.shrink());

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
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
                    image: Image.network(state.object!.hoofdFoto).image,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
          ),
          SliverToBoxAdapter(
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
          ),
          SliverToBoxAdapter(
            child: Text(state.object!.volledigeOmschrijving),
          ),
          SliverToBoxAdapter(
            child: Text(state.object!.volledigeOmschrijving),
          ),
          SliverToBoxAdapter(
            child: Text(state.object!.volledigeOmschrijving),
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
