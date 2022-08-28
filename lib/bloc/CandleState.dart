
import 'package:bitcoin_trading_app/dto/DayCandleDto.dart';
import 'package:equatable/equatable.dart';

abstract class CandleState extends Equatable{}

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

  DayCandleLoaded(this.candles);

  @override
  List<Object?> get props => [];
}