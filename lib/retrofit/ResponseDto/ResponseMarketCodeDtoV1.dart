import 'package:json_annotation/json_annotation.dart';

part 'ResponseMarketCodeDtoV1.g.dart';

@JsonSerializable(explicitToJson: true)
class ResponseMarketCodeDtoV1 {

  List<ResponseMarketCodeDtoV1Data> data;

  ResponseMarketCodeDtoV1(this.data);

  factory ResponseMarketCodeDtoV1.fromJson(Map<String, dynamic> json) => _$ResponseMarketCodeDtoV1FromJson(json);
  Map<String, dynamic> toJson() => _$ResponseMarketCodeDtoV1ToJson(this);
}

@JsonSerializable(explicitToJson: true, fieldRename: FieldRename.snake)
class ResponseMarketCodeDtoV1Data {
  String? marketCode;
  String? koreanName;
  String? englishName;

  ResponseMarketCodeDtoV1Data({
    this.marketCode,
    this.koreanName,
    this.englishName,
  });

  factory ResponseMarketCodeDtoV1Data.fromJson(Map<String, dynamic> json) => _$ResponseMarketCodeDtoV1DataFromJson(json);
  Map<String, dynamic> toJson() => _$ResponseMarketCodeDtoV1DataToJson(this);
}