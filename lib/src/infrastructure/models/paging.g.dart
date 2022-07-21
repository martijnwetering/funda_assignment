// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'paging.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Paging _$PagingFromJson(Map<String, dynamic> json) => Paging(
      json['AantalPaginas'] as int,
      json['HuidigePagina'] as int,
      json['VolgendeUrl'] as String?,
      json['VorigeUrl'] as String?,
    );

Map<String, dynamic> _$PagingToJson(Paging instance) => <String, dynamic>{
      'AantalPaginas': instance.aantalPaginas,
      'HuidigePagina': instance.huidigePagina,
      'VolgendeUrl': instance.volgendeUrl,
      'VorigeUrl': instance.vorigeUrl,
    };
