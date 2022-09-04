import 'package:json_annotation/json_annotation.dart';

part 'ResponseGetMarketCodeDtoV2.g.dart';

@JsonSerializable(explicitToJson: true)
class ResponseGetMarketCodeDtoV2 {

  List<ResponseGetMarketCodeDtoV2Data> data;

  ResponseGetMarketCodeDtoV2(this.data);

  factory ResponseGetMarketCodeDtoV2.fromJson(Map<String, dynamic> json) => _$ResponseGetMarketCodeDtoV2FromJson(json);
  Map<String, dynamic> toJson() => _$ResponseGetMarketCodeDtoV2ToJson(this);
}

@JsonSerializable(explicitToJson: true, fieldRename: FieldRename.snake)
class ResponseGetMarketCodeDtoV2Data {
  String? marketCode;
  String? koreanName;
  String? englishName;
  String? createdDate;

  ResponseGetMarketCodeDtoV2Data({
    this.marketCode,
    this.koreanName,
    this.englishName,
    this.createdDate,
  });

  factory ResponseGetMarketCodeDtoV2Data.fromJson(Map<String, dynamic> json) => _$ResponseGetMarketCodeDtoV2DataFromJson(json);
  Map<String, dynamic> toJson() => _$ResponseGetMarketCodeDtoV2DataToJson(this);
}