// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ResponsePostSyncMarketCodeDtoV1.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ResponsePostSyncMarketCodeDtoV1 _$ResponsePostSyncMarketCodeDtoV1FromJson(
    Map<String, dynamic> json) {
  return ResponsePostSyncMarketCodeDtoV1(
    ResponsePostSyncMarketCodeDtoV1Data.fromJson(
        json['data'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$ResponsePostSyncMarketCodeDtoV1ToJson(
        ResponsePostSyncMarketCodeDtoV1 instance) =>
    <String, dynamic>{
      'data': instance.data.toJson(),
    };

ResponsePostSyncMarketCodeDtoV1Data
    _$ResponsePostSyncMarketCodeDtoV1DataFromJson(Map<String, dynamic> json) {
  return ResponsePostSyncMarketCodeDtoV1Data(
    syncCount: json['sync_count'] as int?,
  );
}

Map<String, dynamic> _$ResponsePostSyncMarketCodeDtoV1DataToJson(
        ResponsePostSyncMarketCodeDtoV1Data instance) =>
    <String, dynamic>{
      'sync_count': instance.syncCount,
    };
