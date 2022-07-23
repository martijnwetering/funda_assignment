// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'search_object.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SearchObject _$SearchObjectFromJson(Map<String, dynamic> json) => SearchObject(
      json['Id'] as String,
      json['GlobalId'] as int,
      json['Koopprijs'] as int,
      json['AangebodenSindsTekst'] as String,
      json['Adres'] as String,
      json['AantalKamers'] as int,
      json['Foto'] as String,
      json['FotoMedium'] as String,
      json['FotoLarge'] as String,
      json['FotoLargest'] as String,
      json['Afstand'] as int,
      json['MakelaarId'] as int,
      json['MakelaarNaam'] as String,
      json['Perceeloppervlakte'] as int,
      json['Woonoppervlakte'] as int,
      json['Woonplaats'] as String,
      json['Postcode'] as String,
      Prijs.fromJson(json['Prijs'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$SearchObjectToJson(SearchObject instance) =>
    <String, dynamic>{
      'Id': instance.id,
      'GlobalId': instance.globalId,
      'Koopprijs': instance.koopprijs,
      'AangebodenSindsTekst': instance.aangebodenSindsTekst,
      'Adres': instance.adres,
      'AantalKamers': instance.aantalKamers,
      'Foto': instance.foto,
      'FotoMedium': instance.fotoMedium,
      'FotoLarge': instance.fotoLarge,
      'FotoLargest': instance.fotoLargest,
      'Afstand': instance.afstand,
      'MakelaarId': instance.makelaarId,
      'MakelaarNaam': instance.makelaarNaam,
      'Perceeloppervlakte': instance.perceeloppervlakte,
      'Woonoppervlakte': instance.woonoppervlakte,
      'Woonplaats': instance.woonplaats,
      'Postcode': instance.postcode,
      'Prijs': instance.prijs.toJson(),
    };
