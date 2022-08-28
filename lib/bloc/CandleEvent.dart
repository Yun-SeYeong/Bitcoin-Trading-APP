import 'package:equatable/equatable.dart';

abstract class CandleEvent extends Equatable {}

class LoadDayCandleEvent extends CandleEvent {
  final String market;
  final int count;

  LoadDayCandleEvent(this.market, this.count);

  @override
  List<Object?> get props => [this.market, this.count];
}