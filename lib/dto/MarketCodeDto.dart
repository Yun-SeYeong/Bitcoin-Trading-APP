class MarketCodeDto {
  String market;
  String koreanName;
  String englishName;

  MarketCodeDto(this.market, this.koreanName, this.englishName);

  @override
  String toString() {
    return 'MarketCodeDto{market: $market, koreanName: $koreanName, englishName: $englishName}';
  }
}
