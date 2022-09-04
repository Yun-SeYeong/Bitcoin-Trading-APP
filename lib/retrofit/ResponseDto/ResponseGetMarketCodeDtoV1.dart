import 'package:json_annotation/json_annotation.dart';

part 'ResponseGetMarketCodeDtoV1.g.dart';

@JsonSerializable(explicitToJson: true)
class ResponseGetMarketCodeDtoV1 {

  List<ResponseGetMarketCodeDtoV1Data> data;

  ResponseGetMarketCodeDtoV1(this.data);

  factory ResponseGetMarketCodeDtoV1.fromJson(Map<String, dynamic> json) => _$ResponseGetMarketCodeDtoV1FromJson(json);
  Map<String, dynamic> toJson() => _$ResponseGetMarketCodeDtoV1ToJson(this);
}

@JsonSerializable(explicitToJson: true, fieldRename: FieldRename.snake)
class ResponseGetMarketCodeDtoV1Data {
  String? marketCode;
  String? koreanName;
  String? englishName;

  ResponseGetMarketCodeDtoV1Data({
    this.marketCode,
    this.koreanName,
    this.englishName,
  });

  factory ResponseGetMarketCodeDtoV1Data.fromJson(Map<String, dynamic> json) => _$ResponseGetMarketCodeDtoV1DataFromJson(json);
  Map<String, dynamic> toJson() => _$ResponseGetMarketCodeDtoV1DataToJson(this);
}