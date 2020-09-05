import 'package:json_annotation/json_annotation.dart';

part 'brand.model.g.dart';

@JsonSerializable(nullable: false)
class Brand {
  final String key;
  final int id;
  final String fipeName;
  final String name;

  Brand(
    this.key,
    this.id,
    this.fipeName,
    this.name,
  );

  factory Brand.fromJson(Map<String, dynamic> json) => _$BrandFromJson(json);
}
