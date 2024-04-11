// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HomeModel _$HomeModelFromJson(Map<String, dynamic> json) => HomeModel(
      id: json['id'] as int?,
      customername: json['customername'] as String?,
      customersurname: json['customersurname'] as String?,
      customerip: json['customerip'] as String?,
      tracks: (json['tracks'] as List<dynamic>?)
          ?.map((e) => Tracks.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$HomeModelToJson(HomeModel instance) => <String, dynamic>{
      'id': instance.id,
      'customername': instance.customername,
      'customersurname': instance.customersurname,
      'customerip': instance.customerip,
      'tracks': instance.tracks,
    };
