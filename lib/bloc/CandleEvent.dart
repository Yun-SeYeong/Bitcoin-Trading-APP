import 'package:equatable/equatable.dart';

abstract class CandleEvent extends Equatable {}

class LoadDayCandleEvent extends CandleEvent {
  final String market;
  final int count;

  LoadDayCandleEvent(this.market, this.count);

  @override
  List<Object?> get props => [this.market, this.count];
}

class LoadMarketCodeEvent extends CandleEvent {
  @override
  List<Object?> get props => [];
}

class LoadMinuteCandleEvent extends CandleEvent {
  final int unit;
  final String market;
  final int count;

  LoadMinuteCandleEvent(this.unit, this.market, this.count);

  @override
  List<Object?> get props => [];
}

class SyncDayCandleEvent extends CandleEvent {
  final String market;
  final String to;
  final int count;

  SyncDayCandleEvent(this.market, this.to, this.count);

  @override
  List<Object?> get props => [];
}

class SyncMinuteCandleEvent extends CandleEvent {
  final String market;
  final int unit;
  final String to;
  final int count;

  SyncMinuteCandleEvent(this.market, this.unit, this.to, this.count);

  @override
  List<Object?> get props => [];
}

class SyncMarketCodeEvent extends CandleEvent {
  SyncMarketCodeEvent();

  @override
  List<Object?> get props => [];
}

class LoadDayCandleMaEvent extends CandleEvent {
  final String market;
  final int count;

  LoadDayCandleMaEvent(this.market, this.count);

  @override
  List<Object?> get props => [this.market, this.count];
}