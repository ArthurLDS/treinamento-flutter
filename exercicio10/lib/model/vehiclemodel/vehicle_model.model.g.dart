// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'vehicle_model.model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

VehileModel _$VehileModelFromJson(Map<String, dynamic> json) {
  return VehileModel(
    json['key'] as String,
    json['id'] as String,
    json['fipe_name'] as String,
    json['name'] as String,
  );
}

Map<String, dynamic> _$VehileModelToJson(VehileModel instance) =>
    <String, dynamic>{
      'key': instance.key,
      'id': instance.id,
      'fipe_name': instance.fipeName,
      'name': instance.name,
    };
