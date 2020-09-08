import 'package:json_annotation/json_annotation.dart';

part 'vehicle_year.model.g.dart';

@JsonSerializable(nullable: false)
class VehicleYear {
  @JsonKey(name: 'fipe_codigo')
  String fipeCodigo;
  String name;
  String key;
  String veiculo;
  String id;

  VehicleYear({
    this.fipeCodigo,
    this.name,
    this.key,
    this.veiculo,
    this.id,
  });

  factory VehicleYear.fromJson(Map<String, dynamic> json) =>
      _$VehicleYearFromJson(json);

}