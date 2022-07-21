import 'package:flutter/foundation.dart';
import 'package:json_annotation/json_annotation.dart';

part 'prijs.g.dart';

@immutable
@JsonSerializable()
class Prijs {
  const Prijs(
    this.koopAbbreviation,
    this.koopprijs,
    this.huurprijs,
    this.huurAbbreviation,
  );

  final String? koopAbbreviation;
  final int? koopprijs;
  final int? huurprijs;
  final String? huurAbbreviation;

  factory Prijs.fromJson(Map<String, dynamic> json) {
    return _$PrijsFromJson(json);
  }

  Map<String, dynamic> toJson() => _$PrijsToJson(this);
}
