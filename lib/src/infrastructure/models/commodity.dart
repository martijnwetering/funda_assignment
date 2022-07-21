import 'package:flutter/foundation.dart';
import 'package:funda_assignment/src/infrastructure/models/prijs.dart';
import 'package:json_annotation/json_annotation.dart';

part 'commodity.g.dart';

@immutable
@JsonSerializable()
class Commodity {
  const Commodity(
    this.id,
    this.globalId,
    this.koopprijs,
    this.aangebodenSindsTekst,
    this.adres,
    this.aantalKamers,
    this.foto,
    this.fotoMedium,
    this.fotoLarge,
    this.fotoLargest,
    this.afstand,
    this.makelaarId,
    this.makelaarNaam,
    this.perceeloppervlakte,
    this.woonoppervlakte,
    this.woonplaats,
    this.prijs,
  );

  final String id;
  final int globalId;
  final int koopprijs;
  final String aangebodenSindsTekst;
  final String adres;
  final int aantalKamers;
  final String foto;
  final String fotoMedium;
  final String fotoLarge;
  final String fotoLargest;
  final int afstand;
  final int makelaarId;
  final String makelaarNaam;
  final int perceeloppervlakte;
  final int woonoppervlakte;
  final String woonplaats;
  final Prijs prijs;

  factory Commodity.fromJson(Map<String, dynamic> json) {
    return _$CommodityFromJson(json);
  }

  Map<String, dynamic> toJson() => _$CommodityToJson(this);
}
