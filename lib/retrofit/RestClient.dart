
import 'package:bitcoin_trading_app/retrofit/ResponseDto/ResponseGetDayCandleDtoV1.dart';
import 'package:bitcoin_trading_app/retrofit/ResponseDto/ResponseGetMarketCodeDtoV1.dart';
import 'package:bitcoin_trading_app/retrofit/ResponseDto/ResponseGetMarketCodeDtoV2.dart';
import 'package:bitcoin_trading_app/retrofit/ResponseDto/ResponseGetMinuteCandleDtoV1.dart';
import 'package:bitcoin_trading_app/retrofit/ResponseDto/ResponsePostSyncDayCandleDtoV1.dart';
import 'package:bitcoin_trading_app/retrofit/ResponseDto/ResponsePostSyncMarketCodeDtoV1.dart';
import 'package:bitcoin_trading_app/retrofit/ResponseDto/ResponsePostSyncMinuteCandleDtoV1.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'RestClient.g.dart';

@RestApi(baseUrl: "http://localhost:8080")
abstract class RestClient {
  factory RestClient(Dio dio, {String baseUrl}) = _RestClient;

  @GET("/candles/day-candle/v1")
  Future<ResponseDayCandleDtoV1> getDayCandleV1(@Query('market') String market, @Query('count') int count);

  @GET("/candles/minute-candle/v1/{unit}")
  Future<ResponseGetMinuteCandleDtoV1> getMinuteCandleV1(@Path('unit') int unit, @Query('market') String market, @Query('count') int count);

  @POST("/sync/day-candle/v1")
  Future<ResponsePostSyncDayCandleDtoV1> postSyncDayCandleV1(@Query('market') String market,@Query('to') String to, @Query('count') int count);

  @POST("/sync/minute-candle/v1/{unit}")
  Future<ResponsePostSyncMinuteCandleDtoV1> postSyncMinuteCandleV1(@Path('unit') int unit, @Query('market') String market,@Query('to') String to, @Query('count') int count);

  @POST("/sync/market-code/v1")
  Future<ResponsePostSyncMarketCodeDtoV1> postSyncMarketCodeV1();

  @GET("/candles/market-code/v1")
  Future<ResponseGetMarketCodeDtoV1> getMarketCodeV1();

  @GET("/candles/market-code/v2")
  Future<ResponseGetMarketCodeDtoV2> getMarketCodeV2();
}