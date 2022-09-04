import 'package:json_annotation/json_annotation.dart';

part 'ResponsePostSyncMarketCodeDtoV1.g.dart';

@JsonSerializable(explicitToJson: true)
class ResponsePostSyncMarketCodeDtoV1 {
  ResponsePostSyncMarketCodeDtoV1Data data;

  ResponsePostSyncMarketCodeDtoV1(this.data);

  factory ResponsePostSyncMarketCodeDtoV1.fromJson(Map<String, dynamic> json) => _$ResponsePostSyncMarketCodeDtoV1FromJson(json);
  Map<String, dynamic> toJson() => _$ResponsePostSyncMarketCodeDtoV1ToJson(this);
}

@JsonSerializable(explicitToJson: true, fieldRename: FieldRename.snake)
class ResponsePostSyncMarketCodeDtoV1Data {
  int? syncCount;

  ResponsePostSyncMarketCodeDtoV1Data({
    this.syncCount
  });

  factory ResponsePostSyncMarketCodeDtoV1Data.fromJson(Map<String, dynamic> json) => _$ResponsePostSyncMarketCodeDtoV1DataFromJson(json);
  Map<String, dynamic> toJson() => _$ResponsePostSyncMarketCodeDtoV1DataToJson(this);
}
