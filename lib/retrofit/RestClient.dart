
import 'package:bitcoin_trading_app/retrofit/ResponseDto/ResponseGetDayCandleDtoV1.dart';
import 'package:bitcoin_trading_app/retrofit/ResponseDto/ResponseGetMarketCodeDtoV1.dart';
import 'package:bitcoin_trading_app/retrofit/ResponseDto/ResponseGetMinuteCandleDtoV1.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'RestClient.g.dart';

@RestApi(baseUrl: "http://10.0.2.2:8080")
abstract class RestClient {
  factory RestClient(Dio dio, {String baseUrl}) = _RestClient;

  @GET("/candles/day-candle/v1")
  Future<ResponseDayCandleDtoV1> getDayCandleV1(@Query('market') String market, @Query('count') int count);

  @GET("/candles/minute-candle/v1/{unit}")
  Future<ResponseGetMinuteCandleDtoV1> getMinuteCandleV1(@Path('unit') int unit, @Query('market') String market, @Query('count') int count);

  @GET("/candles/market-code/v1")
  Future<ResponseMarketCodeDtoV1> getMarketCodeV1();
}