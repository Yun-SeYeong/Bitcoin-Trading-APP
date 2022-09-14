import 'package:bitcoin_trading_app/bloc/CandleEvent.dart';
import 'package:bitcoin_trading_app/bloc/CandleState.dart';
import 'package:bitcoin_trading_app/dto/DayCandleDto.dart';
import 'package:bitcoin_trading_app/dto/CandleMaDto.dart';
import 'package:bitcoin_trading_app/dto/MarketCodeDto.dart';
import 'package:bitcoin_trading_app/dto/MinuteCandleDto.dart';
import 'package:bitcoin_trading_app/retrofit/RestClient.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CandleBloc extends Bloc<CandleEvent, CandleState> {
  final RestClient restClient;

  CandleBloc(this.restClient) : super(Empty()) {
    on<LoadDayCandleEvent>(onLoadDayCandle);
    on<LoadMarketCodeEvent>(onLoadMarketCode);
    on<LoadMinuteCandleEvent>(onLoadMinuteCandle);
    on<SyncDayCandleEvent>(onSyncDayCandle);
    on<SyncMinuteCandleEvent>(onSyncMinuteCandle);
    on<SyncMarketCodeEvent>(onSyncMarketCode);
    on<LoadDayCandleMaEvent>(onLoadDayCandleMa);
  }

  onLoadDayCandleMa(LoadDayCandleMaEvent event,
      Emitter<CandleState> emit) async {
    emit(Loading());
    var daycandlemas = (await restClient.getDayCandleMaV1(
      event.market, event.count,)).data.map((e) =>
        CandleMaDto(
          e.market!,
          DateTime.parse(e.dateTimeKst!),
          e.ma5,
          e.ma10,
          e.ma15,
          e.ma20,
          e.ma60,
          e.ma120,
        )
    ).toList();
    emit(DayCandleMaLoaded(daycandlemas));
  }

  onSyncMarketCode(SyncMarketCodeEvent event, Emitter<CandleState> emit) async {
    emit(Loading());
    int result = (await restClient.postSyncMarketCodeV1())
        .data.syncCount!;
    emit(MarketCodeSynced(result));
    var marketCodes = await (requestMarketCodeV1());
    emit(MarketCodeLoaded(marketCodes));
  }

  onSyncMinuteCandle(SyncMinuteCandleEvent event,
      Emitter<CandleState> emit) async {
    emit(Loading());
    int result = (await restClient.postSyncMinuteCandleV1(
        event.unit, event.market, event.to, event.count))
        .data.syncCount!;
    emit(MinuteCandleSynced(result));
    var candles = await requestGetMinuteCandleV1(
        event.unit, event.market, event.count);
    double syncPercent = candles.length <= 0 ? 0 : candles.length / event.count;
    emit(MinuteCandleLoaded(candles, syncPercent));
  }

  onSyncDayCandle(SyncDayCandleEvent event, Emitter<CandleState> emit) async {
    emit(Loading());
    int result = (await restClient.postSyncDayCandleV1(
        event.market, event.to, event.count))
        .data.syncCount!;
    emit(DayCandleSynced(result));
    List<DayCandleDto> candles = await requestGetDayCandleV1(
        event.market, event.count);
    double syncPercent = candles.length <= 0 ? 0 : candles.length / event.count;
    emit(DayCandleLoaded(candles, syncPercent));
  }

  onLoadDayCandle(LoadDayCandleEvent event, Emitter<CandleState> emit) async {
    emit(Loading());
    List<DayCandleDto> candles = await requestGetDayCandleV1(
        event.market, event.count);
    double syncPercent = candles.length <= 0 ? 0 : candles.length / event.count;
    print(syncPercent);
    emit(DayCandleLoaded(candles, syncPercent));
  }

  Future<List<DayCandleDto>> requestGetDayCandleV1(String market,
      int count) async {
    var candles = (await restClient.getDayCandleV1(market, count))
        .data
        .map((e) =>
        DayCandleDto(
            e.market!,
            DateTime.parse(e.candleDateTimeKst!),
            e.openingPrice!,
            e.highPrice!,
            e.lowPrice!,
            e.tradePrice!,
            e.candleAccTradeVolume!))
        .toList();
    return candles;
  }

  onLoadMinuteCandle(LoadMinuteCandleEvent event,
      Emitter<CandleState> emit) async {
    emit(Loading());
    List<MinuteCandleDto> candles = await requestGetMinuteCandleV1(
        event.unit, event.market, event.count);
    double syncPercent = candles.length <= 0 ? 0 : candles.length / event.count;
    emit(MinuteCandleLoaded(candles, syncPercent));
  }

  Future<List<MinuteCandleDto>> requestGetMinuteCandleV1(int unit,
      String market, int count) async {
    var candles = (await restClient.getMinuteCandleV1(
        unit, market, count))
        .data
        .map((e) =>
        MinuteCandleDto(
            e.market!,
            DateTime.parse(e.candleDateTimeKst!),
            e.openingPrice!,
            e.highPrice!,
            e.lowPrice!,
            e.tradePrice!,
            e.candleAccTradeVolume!))
        .toList();
    return candles;
  }

  onLoadMarketCode(LoadMarketCodeEvent event, Emitter<CandleState> emit) async {
    emit(Loading());
    List<MarketCodeDto> marketCodes = await requestMarketCodeV1();
    emit(MarketCodeLoaded(marketCodes));
  }

  Future<List<MarketCodeDto>> requestMarketCodeV1() async {
    var marketCodes = (await restClient.getMarketCodeV2())
        .data
        .map((e) =>
        MarketCodeDto(e.marketCode!, e.koreanName!, e.englishName!,
            DateTime.parse(e.createdDate!)))
        .toList();
    return marketCodes;
  }
}
