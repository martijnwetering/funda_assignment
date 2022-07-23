import 'package:flutter/material.dart';
import 'package:funda_assignment/src/infrastructure/models/prijs.dart';
import 'package:intl/intl.dart';
import 'package:json_annotation/json_annotation.dart';

part 'object_detail.g.dart';

@immutable
@JsonSerializable()
class ObjectDetail {
  const ObjectDetail(
    this.id,
    this.hoofdFoto,
    this.perceelOppervlakte,
    this.woonOppervlakte,
    this.plaats,
    this.postcode,
    this.volledigeOmschrijving,
    this.adres,
    this.aantalKamers,
    this.bouwjaar,
    this.prijs,
    this.verkoopStatus,
  );

  factory ObjectDetail.fromJson(Map<String, dynamic> json) {
    return _$ObjectDetailFromJson(json);
  }

  Map<String, dynamic> toJson() => _$ObjectDetailToJson(this);

  final int id;
  final String hoofdFoto;
  final int perceelOppervlakte;
  final int woonOppervlakte;
  final String plaats;
  final String postcode;
  final String volledigeOmschrijving;
  final String adres;
  final int aantalKamers;
  final String bouwjaar;
  final Prijs prijs;
  final String verkoopStatus;

  String get formattedPrice =>
      '${NumberFormat.simpleCurrency(locale: 'nl_NL').format(prijs.koopprijs)} '
      '${prijs.koopAbbreviation}';

  String get formattedOppervlakte =>
      '$woonOppervlakte \u33a1 / $perceelOppervlakte \u33a1';
}
