// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ResponseGetDayCandleMaV1.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ResponseGetDayCandleMaV1 _$ResponseGetDayCandleMaV1FromJson(
    Map<String, dynamic> json) {
  return ResponseGetDayCandleMaV1(
    (json['data'] as List<dynamic>)
        .map((e) =>
            ResponseGetDayCandleMaV1Data.fromJson(e as Map<String, dynamic>))
        .toList(),
  );
}

Map<String, dynamic> _$ResponseGetDayCandleMaV1ToJson(
        ResponseGetDayCandleMaV1 instance) =>
    <String, dynamic>{
      'data': instance.data.map((e) => e.toJson()).toList(),
    };

ResponseGetDayCandleMaV1Data _$ResponseGetDayCandleMaV1DataFromJson(
    Map<String, dynamic> json) {
  return ResponseGetDayCandleMaV1Data(
    market: json['market'] as String?,
    dateTimeKst: json['date_time_kst'] as String?,
    ma5: (json['ma5'] as num?)?.toDouble(),
    ma10: (json['ma10'] as num?)?.toDouble(),
    ma15: (json['ma15'] as num?)?.toDouble(),
    ma20: (json['ma20'] as num?)?.toDouble(),
    ma60: (json['ma60'] as num?)?.toDouble(),
    ma120: (json['ma120'] as num?)?.toDouble(),
  );
}

Map<String, dynamic> _$ResponseGetDayCandleMaV1DataToJson(
        ResponseGetDayCandleMaV1Data instance) =>
    <String, dynamic>{
      'market': instance.market,
      'date_time_kst': instance.dateTimeKst,
      'ma5': instance.ma5,
      'ma10': instance.ma10,
      'ma15': instance.ma15,
      'ma20': instance.ma20,
      'ma60': instance.ma60,
      'ma120': instance.ma120,
    };
