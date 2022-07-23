import 'package:flutter/material.dart';
import 'package:funda_assignment/src/presentation/widgets/search_app_bar.dart';
import 'package:funda_assignment/src/presentation/widgets/search_results_list.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  @override
  void initState() {
    super.initState();
  }

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
