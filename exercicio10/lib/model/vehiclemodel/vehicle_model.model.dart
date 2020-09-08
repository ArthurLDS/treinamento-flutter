import 'package:json_annotation/json_annotation.dart';

part 'vehicle_model.model.g.dart';

@JsonSerializable(nullable: false)
class VehileModel {
  String key;
  String id;
  @JsonKey(name: 'fipe_name')
  String fipeName;
  String name;

  VehileModel(
    this.key,
    this.id,
    this.fipeName,
    this.name,
  );

  factory VehileModel.fromJson(Map<String, dynamic> json) =>
      _$VehileModelFromJson(json);

}
