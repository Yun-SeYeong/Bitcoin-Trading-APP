import 'package:bitcoin_trading_app/dto/CandleDto.dart';
import 'package:bitcoin_trading_app/dto/CandleMaDto.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:intl/intl.dart';

import 'bloc/CandleBloc.dart';
import 'bloc/CandleEvent.dart';
import 'bloc/CandleState.dart';
import 'dto/MarketCodeDto.dart';

class AnalysisPage extends StatefulWidget {
  AnalysisPage({Key? key}) : super(key: key);

  @override
  _AnalysisPage createState() => _AnalysisPage();
}

class _AnalysisPage extends State<AnalysisPage> {
  String _chartTitle = "";
  String marketTitle = "";
  final _trackballBehavior = TrackballBehavior(enable: true);
  List<CandleDto> _candles = [];
  List<CandleMaDto> _candlesMa = [];
  List<MarketCodeDto> _marketList = [];

  @override
  void initState() {
    BlocProvider.of<CandleBloc>(context)
        .add(LoadDayCandleEvent("KRW-ETH", 100));
    BlocProvider.of<CandleBloc>(context)
        .add(LoadDayCandleMaEvent("KRW-ETH", 100));
    BlocProvider.of<CandleBloc>(context).add(LoadMarketCodeEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          children: [
            /**
             * Title
             */
            Container(
              alignment: Alignment.center,
              padding: const EdgeInsets.symmetric(vertical: 18.0),
              child: Text(
                marketTitle,
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
            ),
            /**
             * Volume Chart
             */
            Container(
              height: 320,
              child: SfCartesianChart(
                trackballBehavior: _trackballBehavior,
                enableAxisAnimation: true,
                zoomPanBehavior: ZoomPanBehavior(
                    enablePanning: true,
                    enablePinching: true,
                    zoomMode: ZoomMode.x),
                primaryXAxis: DateTimeAxis(
                  title: AxisTitle(
                    text: 'VOLUME',
                    textStyle: TextStyle(fontSize: 12),
                  ),
                  visibleMinimum: _candles.length >= 20
                      ? _candles[20].candleDateTimeKst
                      : null,
                ),
                axes: [
                  NumericAxis(
                    name: 'Y-Axis1',
                    numberFormat: NumberFormat.compactCurrency(symbol: ''),
                    anchorRangeToVisiblePoints: true,
                    rangePadding: ChartRangePadding.additional,
                  ),
                  NumericAxis(
                    name: 'Y-Axis2',
                    opposedPosition: true,
                    numberFormat: NumberFormat.compactCurrency(symbol: ''),
                    anchorRangeToVisiblePoints: true,
                    rangePadding: ChartRangePadding.additional,
                  )
                ],
                series: <ChartSeries>[
                  CandleSeries<CandleDto, DateTime>(
                    yAxisName: 'Y-Axis1',
                    dataSource: _candles,
                    xValueMapper: (data, _) => data.candleDateTimeKst,
                    lowValueMapper: (data, _) => data.lowPrice,
                    highValueMapper: (data, _) => data.highPrice,
                    openValueMapper: (data, _) => data.openPrice,
                    closeValueMapper: (data, _) => data.tradePrice,
                  ),
                  ColumnSeries<CandleDto, DateTime>(
                    yAxisName: 'Y-Axis2',
                    dataSource: _candles,
                    xValueMapper: (data, _) => data.candleDateTimeKst,
                    yValueMapper: (data, _) => data.volume,
                  ),
                ],
              ),
            ),
            /**
             * MACD Chart
             */
            Container(
              height: 400,
              child: SfCartesianChart(
                trackballBehavior: _trackballBehavior,
                enableAxisAnimation: true,
                legend: Legend(
                    isVisible: true,
                    position: LegendPosition.bottom,
                    overflowMode: LegendItemOverflowMode.wrap),
                zoomPanBehavior: ZoomPanBehavior(
                    enablePanning: true,
                    enablePinching: true,
                    zoomMode: ZoomMode.x),
                primaryXAxis: DateTimeAxis(
                  title: AxisTitle(
                    text: 'MACD',
                    textStyle: TextStyle(fontSize: 12),
                  ),
                  visibleMinimum: _candles.length >= 15
                      ? _candles[15].candleDateTimeKst
                      : null,
                ),
                primaryYAxis: NumericAxis(
                  numberFormat: NumberFormat.compactCurrency(symbol: ''),
                  anchorRangeToVisiblePoints: true,
                  rangePadding: ChartRangePadding.additional,
                ),
                series: <ChartSeries>[
                  CandleSeries<CandleDto, DateTime>(
                    dataSource: _candles,
                    isVisibleInLegend: false,
                    xValueMapper: (data, _) => data.candleDateTimeKst,
                    lowValueMapper: (data, _) => data.lowPrice,
                    highValueMapper: (data, _) => data.highPrice,
                    openValueMapper: (data, _) => data.openPrice,
                    closeValueMapper: (data, _) => data.tradePrice,
                  ),
                  LineSeries<CandleMaDto, DateTime>(
                      name: 'ma5',
                      dataSource: _candlesMa,
                      xValueMapper: (data, index) => data.dateTimeKst,
                      yValueMapper: (data, index) => data.ma5,
                      width: 0.75),
                  LineSeries<CandleMaDto, DateTime>(
                      name: 'ma10',
                      dataSource: _candlesMa,
                      xValueMapper: (data, index) => data.dateTimeKst,
                      yValueMapper: (data, index) => data.ma10,
                      width: 0.75),
                  LineSeries<CandleMaDto, DateTime>(
                      name: 'ma15',
                      dataSource: _candlesMa,
                      xValueMapper: (data, index) => data.dateTimeKst,
                      yValueMapper: (data, index) => data.ma15,
                      width: 0.75),
                  LineSeries<CandleMaDto, DateTime>(
                      name: 'ma20',
                      dataSource: _candlesMa,
                      xValueMapper: (data, index) => data.dateTimeKst,
                      yValueMapper: (data, index) => data.ma20,
                      width: 0.75),
                  LineSeries<CandleMaDto, DateTime>(
                      name: 'ma60',
                      dataSource: _candlesMa,
                      xValueMapper: (data, index) => data.dateTimeKst,
                      yValueMapper: (data, index) => data.ma60,
                      width: 0.75),
                  LineSeries<CandleMaDto, DateTime>(
                      name: 'ma120',
                      dataSource: _candlesMa,
                      xValueMapper: (data, index) => data.dateTimeKst,
                      yValueMapper: (data, index) => data.ma120,
                      width: 0.75),
                ],
              ),
            ),
            /**
             * Candle Bloc Builder
             */
            BlocBuilder<CandleBloc, CandleState>(
              builder: (context, state) {
                return Container();
              },
              buildWhen: (previous, current) {
                if (current is DayCandleLoaded) {
                  setState(() {
                    _candles = current.candles
                        .map((e) => CandleDto(e.candleDateTimeKst, e.openPrice,
                            e.highPrice, e.lowPrice, e.tradePrice, e.volume))
                        .toList();
                    if (current.candles.length > 0) {
                      marketTitle = current.candles.first.market;
                    } else {
                      marketTitle = '...';
                    }
                  });
                } else if (current is MinuteCandleLoaded) {
                  setState(() {
                    _candles = current.candles
                        .map((e) => CandleDto(e.candleDateTimeKst, e.openPrice,
                            e.highPrice, e.lowPrice, e.tradePrice, e.volume))
                        .toList();
                    if (current.candles.length > 0) {
                      marketTitle = current.candles.first.market;
                    } else {
                      marketTitle = '...';
                    }
                  });
                } else if (current is MarketCodeLoaded) {
                  setState(() {
                    _marketList = current.marketCodes;
                  });
                } else if (current is DayCandleMaLoaded) {
                  setState(() {
                    _candlesMa = current.mas;
                    print('_candlesMa: $_candlesMa');
                    if (current.mas.length > 0) {
                      marketTitle = current.mas.first.market;
                    }
                  });
                }
                return false;
              },
            ),
          ],
        ),
      ),
    );
  }
}
