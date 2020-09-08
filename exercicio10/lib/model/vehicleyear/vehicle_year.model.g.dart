// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'vehicle_year.model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

VehicleYear _$VehicleYearFromJson(Map<String, dynamic> json) {
  return VehicleYear(
    fipeCodigo: json['fipe_codigo'] as String,
    name: json['name'] as String,
    key: json['key'] as String,
    veiculo: json['veiculo'] as String,
    id: json['id'] as String,
  );
}

Map<String, dynamic> _$VehicleYearToJson(VehicleYear instance) =>
    <String, dynamic>{
      'fipe_codigo': instance.fipeCodigo,
      'name': instance.name,
      'key': instance.key,
      'veiculo': instance.veiculo,
      'id': instance.id,
    };
