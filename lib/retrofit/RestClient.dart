
import 'package:bitcoin_trading_app/retrofit/ResponseDto/ResponseDayCandleDtoV1.dart';
import 'package:bitcoin_trading_app/retrofit/ResponseDto/ResponseMarketCodeDtoV1.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'RestClient.g.dart';

@RestApi(baseUrl: "http://10.0.2.2:8080")
abstract class RestClient {
  factory RestClient(Dio dio, {String baseUrl}) = _RestClient;

  @GET("/candles/day-candle/v1")
  Future<ResponseDayCandleDtoV1> getDayCandleV1(@Query('market') String market, @Query('count') int count);

  @GET("/candles/market-code/v1")
  Future<ResponseMarketCodeDtoV1> getMarketCodeV1();
}