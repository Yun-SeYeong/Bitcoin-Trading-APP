import 'package:json_annotation/json_annotation.dart';

part 'ResponsePostSyncDayCandleDtoV1.g.dart';

@JsonSerializable(explicitToJson: true)
class ResponsePostSyncDayCandleDtoV1 {
  ResponsePostSyncDayCandleDtoV1Data data;

  ResponsePostSyncDayCandleDtoV1(this.data);

  factory ResponsePostSyncDayCandleDtoV1.fromJson(Map<String, dynamic> json) => _$ResponsePostSyncDayCandleDtoV1FromJson(json);
  Map<String, dynamic> toJson() => _$ResponsePostSyncDayCandleDtoV1ToJson(this);
}

@JsonSerializable(explicitToJson: true, fieldRename: FieldRename.snake)
class ResponsePostSyncDayCandleDtoV1Data {
  int? syncCount;

  ResponsePostSyncDayCandleDtoV1Data({
    this.syncCount
  });

  factory ResponsePostSyncDayCandleDtoV1Data.fromJson(Map<String, dynamic> json) => _$ResponsePostSyncDayCandleDtoV1DataFromJson(json);
  Map<String, dynamic> toJson() => _$ResponsePostSyncDayCandleDtoV1DataToJson(this);
}
