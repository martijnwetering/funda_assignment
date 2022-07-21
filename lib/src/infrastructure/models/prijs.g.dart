// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'prijs.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Prijs _$PrijsFromJson(Map<String, dynamic> json) => Prijs(
      json['KoopAbbreviation'] as String?,
      json['Koopprijs'] as int?,
      json['Huurprijs'] as int?,
      json['HuurAbbreviation'] as String?,
    );

Map<String, dynamic> _$PrijsToJson(Prijs instance) => <String, dynamic>{
      'KoopAbbreviation': instance.koopAbbreviation,
      'Koopprijs': instance.koopprijs,
      'Huurprijs': instance.huurprijs,
      'HuurAbbreviation': instance.huurAbbreviation,
    };
