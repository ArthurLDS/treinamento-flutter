// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'brand.model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Brand _$BrandFromJson(Map<String, dynamic> json) {
  return Brand(
    json['key'] as String,
    json['id'] as int,
    json['fipe_name'] as String,
    json['name'] as String,
  );
}

Map<String, dynamic> _$BrandToJson(Brand instance) => <String, dynamic>{
      'key': instance.key,
      'id': instance.id,
      'fipe_name': instance.fipeName,
      'name': instance.name,
    };
