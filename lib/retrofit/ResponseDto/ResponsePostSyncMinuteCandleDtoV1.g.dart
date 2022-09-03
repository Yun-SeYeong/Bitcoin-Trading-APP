// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ResponsePostSyncMinuteCandleDtoV1.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ResponsePostSyncMinuteCandleDtoV1 _$ResponsePostSyncMinuteCandleDtoV1FromJson(
    Map<String, dynamic> json) {
  return ResponsePostSyncMinuteCandleDtoV1(
    ResponsePostSyncMinuteCandleDtoV1Data.fromJson(
        json['data'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$ResponsePostSyncMinuteCandleDtoV1ToJson(
        ResponsePostSyncMinuteCandleDtoV1 instance) =>
    <String, dynamic>{
      'data': instance.data.toJson(),
    };

ResponsePostSyncMinuteCandleDtoV1Data
    _$ResponsePostSyncMinuteCandleDtoV1DataFromJson(Map<String, dynamic> json) {
  return ResponsePostSyncMinuteCandleDtoV1Data(
    syncCount: json['sync_count'] as int?,
  );
}

Map<String, dynamic> _$ResponsePostSyncMinuteCandleDtoV1DataToJson(
        ResponsePostSyncMinuteCandleDtoV1Data instance) =>
    <String, dynamic>{
      'sync_count': instance.syncCount,
    };
