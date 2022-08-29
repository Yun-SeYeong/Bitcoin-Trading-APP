// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ResponseGetDayCandleDtoV1.dart';

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
    candleDateTimeKst: json['candle_date_time_kst'] as String?,
    openingPrice: (json['opening_price'] as num?)?.toDouble(),
    highPrice: (json['high_price'] as num?)?.toDouble(),
    lowPrice: (json['low_price'] as num?)?.toDouble(),
    tradePrice: (json['trade_price'] as num?)?.toDouble(),
    candleAccTradeVolume: (json['candle_acc_trade_volume'] as num?)?.toDouble(),
  );
}

Map<String, dynamic> _$ResponseDayCandleDtoV1DataToJson(
        ResponseDayCandleDtoV1Data instance) =>
    <String, dynamic>{
      'market': instance.market,
      'candle_date_time_kst': instance.candleDateTimeKst,
      'opening_price': instance.openingPrice,
      'high_price': instance.highPrice,
      'low_price': instance.lowPrice,
      'trade_price': instance.tradePrice,
      'candle_acc_trade_volume': instance.candleAccTradeVolume,
    };
