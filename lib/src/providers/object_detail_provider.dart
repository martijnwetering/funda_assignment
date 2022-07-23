import 'package:flutter/material.dart';
import 'package:funda_assignment/src/infrastructure/data_controller.dart';
import 'package:funda_assignment/src/infrastructure/models/object_detail.dart';

/// Responsible for retrieving an objects details from the Funda partner API.
class ObjectDetailProvider extends ChangeNotifier {
  ObjectDetailProvider(this._dataController);

  final DataController _dataController;

  bool loading = true;
  String error = '';
  ObjectDetail? object;

  String get hoofdFoto => object?.hoofdFoto ?? '';
  String get adres => object?.adres ?? '';
  String get postcode => object?.postcode ?? '';
  String get plaats => object?.plaats ?? '';
  String get formattedPrice => object?.formattedPrice ?? '';
  String get formattedOppervlakte => object?.formattedOppervlakte ?? '';
  int get aantalKamers => object?.aantalKamers ?? 0;
  int get perceelOppervlakte => object?.perceelOppervlakte ?? 0;
  int get woonOppervlakte => object?.woonOppervlakte ?? 0;

  bool get hasError => error.isNotEmpty;

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
