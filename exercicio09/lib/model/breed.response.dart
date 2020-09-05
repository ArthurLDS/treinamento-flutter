import 'package:json_annotation/json_annotation.dart';

//part 'breed.response.g.dart';

@JsonSerializable(nullable: false)
class BreedResponse {
  @JsonKey(name: 'message')
  String urlImage;

  BreedResponse(this.urlImage);
}
