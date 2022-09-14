class CandleMaDto {
  String market;
  DateTime dateTimeKst;
  double? ma5;
  double? ma10;
  double? ma15;
  double? ma20;
  double? ma60;
  double? ma120;

  CandleMaDto(this.market, this.dateTimeKst, this.ma5, this.ma10, this.ma15,
      this.ma20, this.ma60, this.ma120);

  @override
  String toString() {
    return 'DayCandleMaDto{market: $market, dateTimeKst: $dateTimeKst, ma5: $ma5, ma10: $ma10, ma15: $ma15, ma20: $ma20, ma60: $ma60, ma120: $ma120}';
  }
}
