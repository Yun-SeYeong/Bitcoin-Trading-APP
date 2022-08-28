import 'package:bitcoin_trading_app/bloc/CandleEvent.dart';
import 'package:bitcoin_trading_app/bloc/CandleState.dart';
import 'package:bitcoin_trading_app/dto/DayCandleDto.dart';
import 'package:bitcoin_trading_app/retrofit/RestClient.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CandleBloc extends Bloc<CandleEvent, CandleState> {
  final RestClient restClient;

  CandleBloc(this.restClient) : super(Empty()) {
    on<LoadDayCandleEvent>(onLoadDayCandle);
  }

  onLoadDayCandle(LoadDayCandleEvent event, Emitter<CandleState> emit) async {
    emit(Loading());
    var candles = (await restClient.getDayCandleV1(event.market, event.count)).data
        .map((e) =>
        DayCandleDto(
            e.market!,
            DateTime.parse(e.candleDateTimeKst!),
            e.openingPrice!,
            e.highPrice!,
            e.lowPrice!,
            e.tradePrice!,
            e.candleAccTradeVolume!)).toList();
    candles.forEach((element) {print(element.toString());});
    emit(DayCandleLoaded(candles));
  }
}