import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:funda_assignment/src/presentation/detail_page.dart';
import 'package:funda_assignment/src/presentation/widgets/search_result_row.dart';
import 'package:funda_assignment/src/providers/search_provider.dart';
import 'package:provider/provider.dart';

class SearchResultsList extends StatelessWidget {
  const SearchResultsList({super.key});

  void _goToDetail(BuildContext context, String id) =>
      Navigator.of(context).pushNamed(
        DetailPage.route,
        arguments: id,
      );

  @override
  Widget build(BuildContext context) {
    final state = context.watch<SearchProvider>();

    if (state.loading) {
      return const SliverFillRemaining(
        child: Center(child: CircularProgressIndicator()),
      );
    }

    if (state.hasError) {
      return SliverFillRemaining(
        child: Center(child: Text(state.error)),
      );
    }

    return SliverList(
      delegate: SliverChildBuilderDelegate(
        (context, index) {
          final itemIndex = index ~/ 2;
          if (index.isEven) {
            final object = state.objects[itemIndex];
            return SearchResultRow(
              object: object,
              onTap: () => _goToDetail(context, object.id),
            );
          }
          return const Divider(height: 0, color: Colors.grey);
        },
        semanticIndexCallback: (Widget widget, int localIndex) {
          if (localIndex.isEven) {
            return localIndex ~/ 2;
          }
          return null;
        },
        childCount: math.max(0, state.objects.length * 2 - 1),
      ),
    );
  }
}
