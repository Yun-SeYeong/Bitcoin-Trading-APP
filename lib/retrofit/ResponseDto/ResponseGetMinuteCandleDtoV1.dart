import 'package:json_annotation/json_annotation.dart';

part 'ResponseGetMinuteCandleDtoV1.g.dart';

@JsonSerializable(explicitToJson: true)
class ResponseGetMinuteCandleDtoV1 {
  List<ResponseGetMinuteCandleDtoV1Data> data;

  ResponseGetMinuteCandleDtoV1(this.data);

  factory ResponseGetMinuteCandleDtoV1.fromJson(Map<String, dynamic> json) => _$ResponseGetMinuteCandleDtoV1FromJson(json);
  Map<String, dynamic> toJson() => _$ResponseGetMinuteCandleDtoV1ToJson(this);
}

@JsonSerializable(explicitToJson: true, fieldRename: FieldRename.snake)
class ResponseGetMinuteCandleDtoV1Data {
  String? market;
  String? candleDateTimeKst;
  double? openingPrice;
  double? highPrice;
  double? lowPrice;
  double? tradePrice;
  double? candleAccTradeVolume;

  ResponseGetMinuteCandleDtoV1Data({
    this.market,
    this.candleDateTimeKst,
    this.openingPrice,
    this.highPrice,
    this.lowPrice,
    this.tradePrice,
    this.candleAccTradeVolume,
  });

  factory ResponseGetMinuteCandleDtoV1Data.fromJson(Map<String, dynamic> json) => _$ResponseGetMinuteCandleDtoV1DataFromJson(json);
  Map<String, dynamic> toJson() => _$ResponseGetMinuteCandleDtoV1DataToJson(this);
}
