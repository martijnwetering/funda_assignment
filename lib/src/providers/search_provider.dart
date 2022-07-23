import 'dart:collection';

import 'package:flutter/cupertino.dart';
import 'package:funda_assignment/src/infrastructure/data_controller.dart';
import 'package:funda_assignment/src/infrastructure/models/search_object.dart';

/// Responsible for executing search requests against the Funda partner api.
class SearchProvider extends ChangeNotifier {
  SearchProvider(this._dataController);

  final DataController _dataController;

  bool loading = false;
  String error = '';
  List<SearchObject> objects = UnmodifiableListView([]);

  bool get hasError => error.isNotEmpty;

  Future<void> search(String term) async {
    loading = true;
    notifyListeners();

    final result = await _dataController.search(term);
    loading = false;
    result.match(
      (failure) {
        error = failure.message;
      },
      (searchResponse) {
        error = '';
        objects = UnmodifiableListView(searchResponse.objects);
      },
    );

    notifyListeners();
  }
}
