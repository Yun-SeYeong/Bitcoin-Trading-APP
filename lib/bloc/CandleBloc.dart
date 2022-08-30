import 'package:bitcoin_trading_app/bloc/CandleEvent.dart';
import 'package:bitcoin_trading_app/bloc/CandleState.dart';
import 'package:bitcoin_trading_app/dto/DayCandleDto.dart';
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
  }

  onSyncDayCandle(SyncDayCandleEvent event, Emitter<CandleState> emit) async {
    emit(Loading());
    int result = (await restClient.postSyncDayCandleV1(event.market, event.to, event.count))
        .data.syncCount!;
    emit(DayCandleSynced(result));
    List<DayCandleDto> candles = await reqeustGetDayCandleV1(event.market, event.count);
    double syncPercent = candles.length <= 0 ? 0 : candles.length / event.count;
    emit(DayCandleLoaded(candles, syncPercent));
  }

  onLoadDayCandle(LoadDayCandleEvent event, Emitter<CandleState> emit) async {
    emit(Loading());
    List<DayCandleDto> candles = await reqeustGetDayCandleV1(event.market, event.count);
    double syncPercent = candles.length <= 0 ? 0 : candles.length / event.count;
    print(syncPercent);
    emit(DayCandleLoaded(candles, syncPercent));
  }

  Future<List<DayCandleDto>> reqeustGetDayCandleV1(String market, int count) async {
    var candles = (await restClient.getDayCandleV1(market, count))
        .data
        .map((e) => DayCandleDto(
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

  onLoadMinuteCandle(
      LoadMinuteCandleEvent event, Emitter<CandleState> emit) async {
    emit(Loading());
    var candles = (await restClient.getMinuteCandleV1(
            event.unit, event.market, event.count))
        .data
        .map((e) => MinuteCandleDto(
            e.market!,
            DateTime.parse(e.candleDateTimeKst!),
            e.openingPrice!,
            e.highPrice!,
            e.lowPrice!,
            e.tradePrice!,
            e.candleAccTradeVolume!))
        .toList();
    double syncPercent = candles.length <= 0 ? 0 : candles.length / event.count;
    emit(MinuteCandleLoaded(candles, syncPercent));
  }

  onLoadMarketCode(LoadMarketCodeEvent event, Emitter<CandleState> emit) async {
    emit(Loading());
    var marketCodes = (await restClient.getMarketCodeV1())
        .data
        .map((e) => MarketCodeDto(e.marketCode!, e.koreanName!, e.englishName!))
        .toList();

    emit(MarketCodeLoaded(marketCodes));
  }
}
