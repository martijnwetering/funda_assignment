// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'search_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SearchResponse _$SearchResponseFromJson(Map<String, dynamic> json) =>
    SearchResponse(
      json['TotaalAantalObjecten'] as int,
      (json['Objects'] as List<dynamic>)
          .map((e) => SearchObject.fromJson(e as Map<String, dynamic>))
          .toList(),
      Paging.fromJson(json['Paging'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$SearchResponseToJson(SearchResponse instance) =>
    <String, dynamic>{
      'TotaalAantalObjecten': instance.totaalAantalObjecten,
      'Objects': instance.objects.map((e) => e.toJson()).toList(),
      'Paging': instance.paging.toJson(),
    };
