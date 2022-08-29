class CandleDto {
  DateTime candleDateTimeKst;
  double openPrice;
  double highPrice;
  double lowPrice;
  double tradePrice;
  double volume;

  CandleDto(this.candleDateTimeKst, this.openPrice, this.highPrice,
      this.lowPrice, this.tradePrice, this.volume);

  @override
  String toString() {
    return 'DayCandleDto{candleDateTimeKst: $candleDateTimeKst, openPrice: $openPrice, highPrice: $highPrice, lowPrice: $lowPrice, tradePrice: $tradePrice, volume: $volume}';
  }
}
