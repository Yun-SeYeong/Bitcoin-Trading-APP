class MarketCodeDto {
  String market;
  String koreanName;
  String englishName;
  DateTime createdDate;

  MarketCodeDto(this.market, this.koreanName, this.englishName, this.createdDate);

  @override
  String toString() {
    return 'MarketCodeDto{market: $market, koreanName: $koreanName, englishName: $englishName, createdDate: $createdDate}';
  }
}
