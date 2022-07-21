import 'package:flutter/foundation.dart';
import 'package:json_annotation/json_annotation.dart';

part 'metadata.g.dart';

@immutable
@JsonSerializable()
class Metadata {
  const Metadata(this.objectType, this.omschrijving, this.titel);

  final String objectType;
  final String omschrijving;
  final String titel;

  factory Metadata.fromJson(Map<String, dynamic> json) {
    return _$MetadataFromJson(json);
  }

  Map<String, dynamic> toJson() => _$MetadataToJson(this);
}
