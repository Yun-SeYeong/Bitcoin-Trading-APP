import 'package:bitcoin_trading_app/bloc/CandleBloc.dart';
import 'package:bitcoin_trading_app/bloc/CandleEvent.dart';
import 'package:bitcoin_trading_app/bloc/CandleState.dart';
import 'package:bitcoin_trading_app/dto/DayCandleDto.dart';
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
  List<DayCandleDto> _candles = [];
  String marketTitle = "...";
  final _unitEditingController = TextEditingController();
  final _marketEditingController = TextEditingController();
  final _countEditingController = TextEditingController();
  final _trackballBehavior = TrackballBehavior(enable: true);
  final _typeList = ['일봉', '분봉'];
  String _selectedValue = '일봉';
  String _chartTitle = '일봉';

  @override
  void initState() {
    BlocProvider.of<CandleBloc>(context).add(LoadDayCandleEvent("KRW-BTC", 50));
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
                    text: _chartTitle,
                    textStyle: TextStyle(
                      fontSize: 12
                    )
                  ),
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
                series: <ChartSeries<DayCandleDto, DateTime>>[
                  CandleSeries<DayCandleDto, DateTime>(
                    dataSource: _candles,
                    xValueMapper: (data, _) => data.candleDateTimeKst,
                    lowValueMapper: (data, _) => data.lowPrice,
                    highValueMapper: (data, _) => data.highPrice,
                    openValueMapper: (data, _) => data.openPrice,
                    closeValueMapper: (data, _) => data.tradePrice,
                  ),
                  ColumnSeries<DayCandleDto, DateTime>(
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
                    items: _typeList.map((e) => DropdownMenuItem(value: e, child: Text(e))).toList(),
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
             * Market Input Field
             */
            Container(
              padding:
                  const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
              child: TextField(
                controller: _marketEditingController,
                decoration: InputDecoration(
                    border: OutlineInputBorder(), hintText: 'Market'),
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
                  final market = _marketEditingController.text.isNotEmpty
                      ? _marketEditingController.text
                      : 'KRW-BTC';
                  final count = int.parse(
                      _countEditingController.text.isNotEmpty
                          ? _countEditingController.text
                          : '0');
                  BlocProvider.of<CandleBloc>(context)
                      .add(LoadDayCandleEvent(market, count));
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
                  print('data loaded');
                  setState(() {
                    _candles = current.candles;
                    marketTitle = current.candles.first.market;
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
