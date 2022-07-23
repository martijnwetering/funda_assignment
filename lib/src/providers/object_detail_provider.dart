import 'package:flutter/material.dart';
import 'package:funda_assignment/src/infrastructure/data_controller.dart';
import 'package:funda_assignment/src/infrastructure/models/object_detail.dart';

class ObjectDetailProvider extends ChangeNotifier {
  ObjectDetailProvider(this._dataController);

  final DataController _dataController;

  bool loading = true;
  String error = '';
  ObjectDetail? object;

  Future<void> fetchObject(String id) async {
    final result = await _dataController.fetchObject(id);

    loading = false;

    result.match(
      (failure) => error = failure.message,
      (obj) => object = obj,
    );

    notifyListeners();
  }
}
