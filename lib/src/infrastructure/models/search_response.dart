import 'package:flutter/foundation.dart';
import 'package:funda_assignment/src/infrastructure/models/paging.dart';
import 'package:funda_assignment/src/infrastructure/models/search_object.dart';
import 'package:json_annotation/json_annotation.dart';

part 'search_response.g.dart';

@immutable
@JsonSerializable()
class SearchResponse {
  const SearchResponse(
    this.totaalAantalObjecten,
    this.objects,
    this.paging,
  );

  factory SearchResponse.fromJson(Map<String, dynamic> json) {
    return _$SearchResponseFromJson(json);
  }

  Map<String, dynamic> toJson() => _$SearchResponseToJson(this);

  final int totaalAantalObjecten;
  final List<SearchObject> objects;
  final Paging paging;
}
