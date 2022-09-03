import 'package:json_annotation/json_annotation.dart';

part 'ResponsePostSyncMinuteCandleDtoV1.g.dart';

@JsonSerializable(explicitToJson: true)
class ResponsePostSyncMinuteCandleDtoV1 {
  ResponsePostSyncMinuteCandleDtoV1Data data;

  ResponsePostSyncMinuteCandleDtoV1(this.data);

  factory ResponsePostSyncMinuteCandleDtoV1.fromJson(Map<String, dynamic> json) => _$ResponsePostSyncMinuteCandleDtoV1FromJson(json);
  Map<String, dynamic> toJson() => _$ResponsePostSyncMinuteCandleDtoV1ToJson(this);
}

@JsonSerializable(explicitToJson: true, fieldRename: FieldRename.snake)
class ResponsePostSyncMinuteCandleDtoV1Data {
  int? syncCount;

  ResponsePostSyncMinuteCandleDtoV1Data({
    this.syncCount
  });

  factory ResponsePostSyncMinuteCandleDtoV1Data.fromJson(Map<String, dynamic> json) => _$ResponsePostSyncMinuteCandleDtoV1DataFromJson(json);
  Map<String, dynamic> toJson() => _$ResponsePostSyncMinuteCandleDtoV1DataToJson(this);
}
