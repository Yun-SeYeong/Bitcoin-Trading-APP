// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ResponseGetMarketCodeDtoV2.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ResponseGetMarketCodeDtoV2 _$ResponseGetMarketCodeDtoV2FromJson(
    Map<String, dynamic> json) {
  return ResponseGetMarketCodeDtoV2(
    (json['data'] as List<dynamic>)
        .map((e) =>
            ResponseGetMarketCodeDtoV2Data.fromJson(e as Map<String, dynamic>))
        .toList(),
  );
}

Map<String, dynamic> _$ResponseGetMarketCodeDtoV2ToJson(
        ResponseGetMarketCodeDtoV2 instance) =>
    <String, dynamic>{
      'data': instance.data.map((e) => e.toJson()).toList(),
    };

ResponseGetMarketCodeDtoV2Data _$ResponseGetMarketCodeDtoV2DataFromJson(
    Map<String, dynamic> json) {
  return ResponseGetMarketCodeDtoV2Data(
    marketCode: json['market_code'] as String?,
    koreanName: json['korean_name'] as String?,
    englishName: json['english_name'] as String?,
    createdDate: json['created_date'] as String?,
  );
}

Map<String, dynamic> _$ResponseGetMarketCodeDtoV2DataToJson(
        ResponseGetMarketCodeDtoV2Data instance) =>
    <String, dynamic>{
      'market_code': instance.marketCode,
      'korean_name': instance.koreanName,
      'english_name': instance.englishName,
      'created_date': instance.createdDate,
    };
