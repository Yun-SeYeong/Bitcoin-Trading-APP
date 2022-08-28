class DayCandleDto {
  String market;
  DateTime candleDateTimeKst;
  double openPrice;
  double highPrice;
  double lowPrice;
  double tradePrice;
  double volume;

  DayCandleDto(this.market, this.candleDateTimeKst, this.openPrice, this.highPrice,
      this.lowPrice, this.tradePrice, this.volume);

  @override
  String toString() {
    return 'DayCandleDto{market: $market, candleDateTimeKst: $candleDateTimeKst, openPrice: $openPrice, highPrice: $highPrice, lowPrice: $lowPrice, tradePrice: $tradePrice, volume: $volume}';
  }
}
