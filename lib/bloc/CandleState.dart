import 'package:bitcoin_trading_app/dto/DayCandleDto.dart';
import 'package:bitcoin_trading_app/dto/MarketCodeDto.dart';
import 'package:bitcoin_trading_app/dto/MinuteCandleDto.dart';
import 'package:equatable/equatable.dart';

abstract class CandleState extends Equatable {}

class Empty extends CandleState {
  @override
  List<Object?> get props => [];
}

class Loading extends CandleState {
  @override
  List<Object?> get props => [];
}

class DayCandleLoaded extends CandleState {
  final List<DayCandleDto> candles;
  final double syncPercent;

  DayCandleLoaded(this.candles, this.syncPercent);

  @override
  List<Object?> get props => [];
}

class MarketCodeLoaded extends CandleState {
  final List<MarketCodeDto> marketCodes;

  MarketCodeLoaded(this.marketCodes);

  @override
  List<Object?> get props => [];
}

class MinuteCandleLoaded extends CandleState {
  final List<MinuteCandleDto> candles;
  final double syncPercent;

  MinuteCandleLoaded(this.candles, this.syncPercent);

  @override
  List<Object?> get props => [];
}

class DayCandleSynced extends CandleState {
  final int count;

  DayCandleSynced(this.count);

  @override
  List<Object?> get props => [];
}

class MinuteCandleSynced extends CandleState {
  final int count;

  MinuteCandleSynced(this.count);

  @override
  List<Object?> get props => [];
}

class MarketCodeSynced extends CandleState {
  final int count;

  MarketCodeSynced(this.count);

  @override
  List<Object?> get props => [];
}