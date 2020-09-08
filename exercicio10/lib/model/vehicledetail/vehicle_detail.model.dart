import 'package:json_annotation/json_annotation.dart';

part 'vehicle_detail.model.g.dart';

@JsonSerializable(nullable: false)
class VehicleDetailModel {
  String id;
  @JsonKey(name: 'ano_modelo')
  String anoModelo;
  String marca;
  String name;
  String veiculo;
  String preco;
  String combustivel;
  String referencia;
  @JsonKey(name: 'fipe_codigo')
  String fipeCodigo;
  String key;

  VehicleDetailModel(
      this.id,
      this.anoModelo,
      this.marca,
      this.name,
      this.veiculo,
      this.preco,
      this.combustivel,
      this.referencia,
      this.fipeCodigo,
      this.key);

  factory VehicleDetailModel.fromJson(Map<String, dynamic> json) =>
      _$VehicleDetailModelFromJson(json);

}