import 'dart:collection';

import 'package:flutter/cupertino.dart';
import 'package:funda_assignment/src/infrastructure/data_controller.dart';
import 'package:funda_assignment/src/infrastructure/models/commodity.dart';

class SearchProvider extends ChangeNotifier {
  SearchProvider(this._dataController);

  final DataController _dataController;

  bool loading = false;
  String error = '';
  List<Commodity> objects = UnmodifiableListView([]);

  bool get hasError => error.isNotEmpty;

  Future<void> search(String term) async {
    loading = true;
    notifyListeners();

    final result = await _dataController.search(term);
    result.match(
      (failure) {
        loading = false;
        error = failure.message;
        notifyListeners();
      },
      (searchResponse) {
        loading = false;
        objects = UnmodifiableListView(searchResponse.objects);
        notifyListeners();
      },
    );
  }
}
