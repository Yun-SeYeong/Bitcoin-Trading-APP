// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ResponsePostSyncDayCandleDtoV1.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ResponsePostSyncDayCandleDtoV1 _$ResponsePostSyncDayCandleDtoV1FromJson(
    Map<String, dynamic> json) {
  return ResponsePostSyncDayCandleDtoV1(
    ResponsePostSyncDayCandleDtoV1Data.fromJson(
        json['data'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$ResponsePostSyncDayCandleDtoV1ToJson(
        ResponsePostSyncDayCandleDtoV1 instance) =>
    <String, dynamic>{
      'data': instance.data.toJson(),
    };

ResponsePostSyncDayCandleDtoV1Data _$ResponsePostSyncDayCandleDtoV1DataFromJson(
    Map<String, dynamic> json) {
  return ResponsePostSyncDayCandleDtoV1Data(
    syncCount: json['sync_count'] as int?,
  );
}

Map<String, dynamic> _$ResponsePostSyncDayCandleDtoV1DataToJson(
        ResponsePostSyncDayCandleDtoV1Data instance) =>
    <String, dynamic>{
      'sync_count': instance.syncCount,
    };
