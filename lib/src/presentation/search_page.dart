import 'package:flutter/material.dart';
import 'package:funda_assignment/src/presentation/widgets/search_app_bar.dart';
import 'package:funda_assignment/src/presentation/widgets/search_results_list.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: const Scaffold(
        body: CustomScrollView(
          slivers: [
            SearchAppBar(),
            SearchResultsList(),
          ],
        ),
      ),
    );
  }
}
