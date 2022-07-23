// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'object_detail.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ObjectDetail _$ObjectDetailFromJson(Map<String, dynamic> json) => ObjectDetail(
      json['Id'] as int,
      json['HoofdFoto'] as String,
      json['PerceelOppervlakte'] as int,
      json['WoonOppervlakte'] as int,
      json['Plaats'] as String,
      json['Postcode'] as String,
      json['VolledigeOmschrijving'] as String,
      json['Adres'] as String,
      json['AantalKamers'] as int,
      json['Bouwjaar'] as String,
      Prijs.fromJson(json['Prijs'] as Map<String, dynamic>),
      json['VerkoopStatus'] as String,
    );

Map<String, dynamic> _$ObjectDetailToJson(ObjectDetail instance) =>
    <String, dynamic>{
      'Id': instance.id,
      'HoofdFoto': instance.hoofdFoto,
      'PerceelOppervlakte': instance.perceelOppervlakte,
      'WoonOppervlakte': instance.woonOppervlakte,
      'Plaats': instance.plaats,
      'Postcode': instance.postcode,
      'VolledigeOmschrijving': instance.volledigeOmschrijving,
      'Adres': instance.adres,
      'AantalKamers': instance.aantalKamers,
      'Bouwjaar': instance.bouwjaar,
      'Prijs': instance.prijs.toJson(),
      'VerkoopStatus': instance.verkoopStatus,
    };
