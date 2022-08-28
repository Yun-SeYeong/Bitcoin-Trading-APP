
import 'package:bitcoin_trading_app/retrofit/ResponseDto/ResponseDayCandleDtoV1.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'RestClient.g.dart';

@RestApi(baseUrl: "http://192.168.0.100:8080")
abstract class RestClient {
  factory RestClient(Dio dio, {String baseUrl}) = _RestClient;

  @GET("/candles/day-candle/v1")
  Future<ResponseDayCandleDtoV1> getDayCandleV1(@Query('market') String market, @Query('count') int count);
}