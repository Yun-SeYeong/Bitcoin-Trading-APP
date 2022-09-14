import 'package:json_annotation/json_annotation.dart';

part 'ResponseGetDayCandleMaV1.g.dart';

@JsonSerializable(explicitToJson: true)
class ResponseGetDayCandleMaV1 {

  List<ResponseGetDayCandleMaV1Data> data;

  ResponseGetDayCandleMaV1(this.data);

  factory ResponseGetDayCandleMaV1.fromJson(Map<String, dynamic> json) => _$ResponseGetDayCandleMaV1FromJson(json);
  Map<String, dynamic> toJson() => _$ResponseGetDayCandleMaV1ToJson(this);
}

@JsonSerializable(explicitToJson: true, fieldRename: FieldRename.snake)
class ResponseGetDayCandleMaV1Data {
  String? market;
  String? dateTimeKst;
  double? ma5;
  double? ma10;
  double? ma15;
  double? ma20;
  double? ma60;
  double? ma120;

  ResponseGetDayCandleMaV1Data({
    this.market,
    this.dateTimeKst,
    this.ma5,
    this.ma10,
    this.ma15,
    this.ma20,
    this.ma60,
    this.ma120
  });

  factory ResponseGetDayCandleMaV1Data.fromJson(Map<String, dynamic> json) => _$ResponseGetDayCandleMaV1DataFromJson(json);
  Map<String, dynamic> toJson() => _$ResponseGetDayCandleMaV1DataToJson(this);
}