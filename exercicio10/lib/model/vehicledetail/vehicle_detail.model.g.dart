// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'vehicle_detail.model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

VehicleDetailModel _$VehicleDetailModelFromJson(Map<String, dynamic> json) {
  return VehicleDetailModel(
    json['id'] as String,
    json['ano_modelo'] as String,
    json['marca'] as String,
    json['name'] as String,
    json['veiculo'] as String,
    json['preco'] as String,
    json['combustivel'] as String,
    json['referencia'] as String,
    json['fipe_codigo'] as String,
    json['key'] as String,
  );
}

Map<String, dynamic> _$VehicleDetailModelToJson(VehicleDetailModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'ano_modelo': instance.anoModelo,
      'marca': instance.marca,
      'name': instance.name,
      'veiculo': instance.veiculo,
      'preco': instance.preco,
      'combustivel': instance.combustivel,
      'referencia': instance.referencia,
      'fipe_codigo': instance.fipeCodigo,
      'key': instance.key,
    };
