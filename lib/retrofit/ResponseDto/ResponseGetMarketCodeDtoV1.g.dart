// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ResponseGetMarketCodeDtoV1.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ResponseGetMarketCodeDtoV1 _$ResponseGetMarketCodeDtoV1FromJson(
    Map<String, dynamic> json) {
  return ResponseGetMarketCodeDtoV1(
    (json['data'] as List<dynamic>)
        .map((e) =>
            ResponseGetMarketCodeDtoV1Data.fromJson(e as Map<String, dynamic>))
        .toList(),
  );
}

Map<String, dynamic> _$ResponseGetMarketCodeDtoV1ToJson(
        ResponseGetMarketCodeDtoV1 instance) =>
    <String, dynamic>{
      'data': instance.data.map((e) => e.toJson()).toList(),
    };

ResponseGetMarketCodeDtoV1Data _$ResponseGetMarketCodeDtoV1DataFromJson(
    Map<String, dynamic> json) {
  return ResponseGetMarketCodeDtoV1Data(
    marketCode: json['market_code'] as String?,
    koreanName: json['korean_name'] as String?,
    englishName: json['english_name'] as String?,
  );
}

Map<String, dynamic> _$ResponseGetMarketCodeDtoV1DataToJson(
        ResponseGetMarketCodeDtoV1Data instance) =>
    <String, dynamic>{
      'market_code': instance.marketCode,
      'korean_name': instance.koreanName,
      'english_name': instance.englishName,
    };
