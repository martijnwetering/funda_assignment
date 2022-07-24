import 'package:flutter/material.dart';
import 'package:funda_assignment/src/extensions/build_context_extensions.dart';
import 'package:funda_assignment/src/providers/search_provider.dart';
import 'package:provider/provider.dart';

class SearchAppBar extends StatefulWidget {
  const SearchAppBar({super.key});

  @override
  State<SearchAppBar> createState() => _SearchAppBarState();
}

class _SearchAppBarState extends State<SearchAppBar> {
  late final TextEditingController _searchTextController;
  late final FocusNode _searchFocusNode;

  @override
  void initState() {
    super.initState();
    _searchTextController = TextEditingController();
    _searchFocusNode = FocusNode();
  }

  @override
  void dispose() {
    super.dispose();
    _searchTextController.dispose();
    _searchFocusNode.dispose();
  }

  void _onEditingComplete() {
    _searchFocusNode.unfocus();
    context.read<SearchProvider>().search(_searchTextController.text);
  }

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      floating: true,
      stretch: true,
      flexibleSpace: FlexibleSpaceBar(
        background: SafeArea(
          child: Column(
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 10,
                    horizontal: 30,
                  ),
                  child: TextField(
                    key: const ValueKey('search'),
                    controller: _searchTextController,
                    focusNode: _searchFocusNode,
                    decoration: InputDecoration(
                      label: Text(context.l10n.search),
                      isDense: true,
                      floatingLabelBehavior: FloatingLabelBehavior.never,
                      suffixIcon: IconButton(
                        onPressed: _onEditingComplete,
                        icon: const Icon(Icons.search),
                      ),
                    ),
                    textInputAction: TextInputAction.search,
                    onEditingComplete: _onEditingComplete,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
