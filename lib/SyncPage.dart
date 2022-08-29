import 'package:bitcoin_trading_app/bloc/CandleBloc.dart';
import 'package:bitcoin_trading_app/bloc/CandleEvent.dart';
import 'package:bitcoin_trading_app/bloc/CandleState.dart';
import 'package:bitcoin_trading_app/dto/CandleDto.dart';
import 'package:bitcoin_trading_app/dto/DayCandleDto.dart';
import 'package:bitcoin_trading_app/dto/MarketCodeDto.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:intl/intl.dart';

class SyncPage extends StatefulWidget {
  SyncPage({Key? key}) : super(key: key);

  @override
  _SyncPage createState() => _SyncPage();
}

class _SyncPage extends State<SyncPage> {
  List<CandleDto> _candles = [];
  String marketTitle = "...";
  final _unitEditingController = TextEditingController();
  final _countEditingController = TextEditingController();
  final _trackballBehavior = TrackballBehavior(enable: true);
  final _typeList = ['일봉', '분봉'];
  String _selectedValue = '일봉';
  List<MarketCodeDto> _marketList = [];
  String _selectedMarket = 'KRW-BTC';
  String _chartTitle = '일봉';

  @override
  void initState() {
    BlocProvider.of<CandleBloc>(context).add(LoadDayCandleEvent("KRW-BTC", 50));
    BlocProvider.of<CandleBloc>(context).add(LoadMarketCodeEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          physics: BouncingScrollPhysics(),
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
             * Chart
             */
            Container(
              height: 320,
              child: SfCartesianChart(
                trackballBehavior: _trackballBehavior,
                enableAxisAnimation: true,
                primaryXAxis: DateTimeAxis(
                  title: AxisTitle(
                      text: _chartTitle, textStyle: TextStyle(fontSize: 12)),
                ),
                primaryYAxis: NumericAxis(
                  numberFormat: NumberFormat.compactCurrency(symbol: ''),
                  opposedPosition: true,
                ),
                axes: <ChartAxis>[
                  NumericAxis(
                    name: 'Y-Axis',
                    numberFormat: NumberFormat.compactCurrency(symbol: ''),
                    opposedPosition: true,
                  )
                ],
                series: <ChartSeries<CandleDto, DateTime>>[
                  CandleSeries<CandleDto, DateTime>(
                    dataSource: _candles,
                    xValueMapper: (data, _) => data.candleDateTimeKst,
                    lowValueMapper: (data, _) => data.lowPrice,
                    highValueMapper: (data, _) => data.highPrice,
                    openValueMapper: (data, _) => data.openPrice,
                    closeValueMapper: (data, _) => data.tradePrice,
                  ),
                  ColumnSeries<CandleDto, DateTime>(
                    yAxisName: 'Y-Axis',
                    dataSource: _candles,
                    xValueMapper: (data, _) => data.candleDateTimeKst,
                    yValueMapper: (data, _) => data.volume,
                  ),
                ],
              ),
            ),
            /**
             * 분봉, 일봉 선택
             */
            Container(
              padding:
                  const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
              child: Row(
                children: [
                  DropdownButton(
                    value: _selectedValue,
                    items: _typeList
                        .map((e) => DropdownMenuItem(value: e, child: Text(e)))
                        .toList(),
                    onChanged: (String? value) {
                      setState(() {
                        _selectedValue = value ?? _typeList[0];
                      });
                    },
                  ),
                ],
              ),
            ),
            /**
             * Unit Input Field
             */
            Visibility(
              visible: _selectedValue == '분봉',
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
                child: TextField(
                  controller: _unitEditingController,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(), hintText: 'Unit'),
                ),
              ),
            ),
            /**
             * Market 선택
             */
            Container(
              padding:
                  const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
              child: Row(
                children: [
                  DropdownButton(
                    value: _selectedMarket,
                    items: _marketList
                        .map((e) => DropdownMenuItem(
                            value: e.market, child: Text(e.market)))
                        .toList(),
                    onChanged: (String? value) {
                      setState(() {
                        _selectedMarket = value ?? 'KRW-BTC';
                      });
                    },
                  ),
                ],
              ),
            ),
            /**
             * Count Input Field
             */
            Container(
              padding:
                  const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
              child: TextField(
                controller: _countEditingController,
                decoration: InputDecoration(
                    border: OutlineInputBorder(), hintText: 'Count'),
              ),
            ),
            /**
             * Candle Load Button
             */
            Container(
              padding:
                  const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
              child: OutlinedButton(
                style: OutlinedButton.styleFrom(backgroundColor: Colors.black),
                onPressed: () {
                  final unit = int.parse(_unitEditingController.text.isNotEmpty
                      ? _unitEditingController.text
                      : '3');
                  final market = _selectedMarket.isNotEmpty
                      ? _selectedMarket
                      : 'KRW-BTC';
                  final count = int.parse(
                      _countEditingController.text.isNotEmpty
                          ? _countEditingController.text
                          : '0');

                  if (_selectedValue == '일봉') {
                    BlocProvider.of<CandleBloc>(context)
                        .add(LoadDayCandleEvent(market, count));
                  } else {
                    BlocProvider.of<CandleBloc>(context)
                        .add(LoadMinuteCandleEvent(unit, market, count));
                  }
                },
                child: Text(
                  '조회',
                  style: TextStyle(color: Colors.white, fontSize: 18),
                ),
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
                        .map((e) => CandleDto(
                            e.candleDateTimeKst,
                            e.openPrice,
                            e.highPrice,
                            e.lowPrice,
                            e.tradePrice,
                            e.volume))
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
                        .map((e) => CandleDto(
                            e.candleDateTimeKst,
                            e.openPrice,
                            e.highPrice,
                            e.lowPrice,
                            e.tradePrice,
                            e.volume))
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
                }
                return false;
              },
            ),
            SizedBox(height: 24)
          ],
        ),
      ),
    );
  }
}
