import 'package:flutter/foundation.dart';
import 'package:json_annotation/json_annotation.dart';

part 'paging.g.dart';

@immutable
@JsonSerializable()
class Paging {
  const Paging(
    this.aantalPaginas,
    this.huidigePagina,
    this.volgendeUrl,
    this.vorigeUrl,
  );

  final int aantalPaginas;
  final int huidigePagina;
  final String? volgendeUrl;
  final String? vorigeUrl;

  factory Paging.fromJson(Map<String, dynamic> json) {
    return _$PagingFromJson(json);
  }

  Map<String, dynamic> toJson() => _$PagingToJson(this);
}
