import 'package:flutter/material.dart';
import 'package:funda_assignment/src/infrastructure/models/search_response.dart';

import '../infrastructure/data_controller.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final DataController _dataController = DataController();
  SearchResponse? _searchResponse;

  @override
  void initState() {
    super.initState();
    _dataController.search('').then(
          (result) => result.match(
            (_) {},
            (searchResponse) =>
                setState(() => _searchResponse = searchResponse),
          ),
        );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _searchResponse != null
          ? SearchResultList(response: _searchResponse!)
          : const EmptyState(),
    );
  }
}

class EmptyState extends StatelessWidget {
  const EmptyState({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(child: Text('No search results.'));
  }
}

class SearchResultList extends StatelessWidget {
  const SearchResultList({
    super.key,
    required this.response,
  });

  final SearchResponse response;

  @override
  Widget build(BuildContext context) {
    return Center(child: Text(response.objects[0].aangebodenSindsTekst));
  }
}
