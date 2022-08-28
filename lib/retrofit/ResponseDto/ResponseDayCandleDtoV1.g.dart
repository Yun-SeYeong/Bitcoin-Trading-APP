// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ResponseDayCandleDtoV1.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ResponseDayCandleDtoV1 _$ResponseDayCandleDtoV1FromJson(
    Map<String, dynamic> json) {
  return ResponseDayCandleDtoV1(
    (json['data'] as List<dynamic>)
        .map((e) =>
            ResponseDayCandleDtoV1Data.fromJson(e as Map<String, dynamic>))
        .toList(),
  );
}

Map<String, dynamic> _$ResponseDayCandleDtoV1ToJson(
        ResponseDayCandleDtoV1 instance) =>
    <String, dynamic>{
      'data': instance.data.map((e) => e.toJson()).toList(),
    };

ResponseDayCandleDtoV1Data _$ResponseDayCandleDtoV1DataFromJson(
    Map<String, dynamic> json) {
  return ResponseDayCandleDtoV1Data(
    market: json['market'] as String?,
    candleDateTimeKst: json['candleDateTimeKst'] as String?,
    openingPrice: (json['openingPrice'] as num?)?.toDouble(),
    highPrice: (json['highPrice'] as num?)?.toDouble(),
    lowPrice: (json['lowPrice'] as num?)?.toDouble(),
    tradePrice: (json['tradePrice'] as num?)?.toDouble(),
    candleAccTradeVolume: (json['candleAccTradeVolume'] as num?)?.toDouble(),
  );
}

Map<String, dynamic> _$ResponseDayCandleDtoV1DataToJson(
        ResponseDayCandleDtoV1Data instance) =>
    <String, dynamic>{
      'market': instance.market,
      'candleDateTimeKst': instance.candleDateTimeKst,
      'openingPrice': instance.openingPrice,
      'highPrice': instance.highPrice,
      'lowPrice': instance.lowPrice,
      'tradePrice': instance.tradePrice,
      'candleAccTradeVolume': instance.candleAccTradeVolume,
    };
