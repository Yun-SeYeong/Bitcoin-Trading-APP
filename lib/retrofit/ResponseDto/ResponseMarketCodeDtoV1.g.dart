// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ResponseMarketCodeDtoV1.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ResponseMarketCodeDtoV1 _$ResponseMarketCodeDtoV1FromJson(
    Map<String, dynamic> json) {
  return ResponseMarketCodeDtoV1(
    (json['data'] as List<dynamic>)
        .map((e) =>
            ResponseMarketCodeDtoV1Data.fromJson(e as Map<String, dynamic>))
        .toList(),
  );
}

Map<String, dynamic> _$ResponseMarketCodeDtoV1ToJson(
        ResponseMarketCodeDtoV1 instance) =>
    <String, dynamic>{
      'data': instance.data.map((e) => e.toJson()).toList(),
    };

ResponseMarketCodeDtoV1Data _$ResponseMarketCodeDtoV1DataFromJson(
    Map<String, dynamic> json) {
  return ResponseMarketCodeDtoV1Data(
    marketCode: json['market_code'] as String?,
    koreanName: json['korean_name'] as String?,
    englishName: json['english_name'] as String?,
  );
}

Map<String, dynamic> _$ResponseMarketCodeDtoV1DataToJson(
        ResponseMarketCodeDtoV1Data instance) =>
    <String, dynamic>{
      'market_code': instance.marketCode,
      'korean_name': instance.koreanName,
      'english_name': instance.englishName,
    };
