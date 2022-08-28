import 'package:json_annotation/json_annotation.dart';

part 'ResponseDayCandleDtoV1.g.dart';

@JsonSerializable(explicitToJson: true)
class ResponseDayCandleDtoV1 {

  List<ResponseDayCandleDtoV1Data> data;

  ResponseDayCandleDtoV1(this.data);

  factory ResponseDayCandleDtoV1.fromJson(Map<String, dynamic> json) => _$ResponseDayCandleDtoV1FromJson(json);
  Map<String, dynamic> toJson() => _$ResponseDayCandleDtoV1ToJson(this);
}

@JsonSerializable(explicitToJson: true)
class ResponseDayCandleDtoV1Data {
  String? market;
  String? candleDateTimeKst;
  double? openingPrice;
  double? highPrice;
  double? lowPrice;
  double? tradePrice;
  double? candleAccTradeVolume;

  ResponseDayCandleDtoV1Data({
    this.market,
    this.candleDateTimeKst,
    this.openingPrice,
    this.highPrice,
    this.lowPrice,
    this.tradePrice,
    this.candleAccTradeVolume,
  });

  factory ResponseDayCandleDtoV1Data.fromJson(Map<String, dynamic> json) => _$ResponseDayCandleDtoV1DataFromJson(json);
  Map<String, dynamic> toJson() => _$ResponseDayCandleDtoV1DataToJson(this);
}