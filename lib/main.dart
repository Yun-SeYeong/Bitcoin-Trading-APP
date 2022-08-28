import 'package:bitcoin_trading_app/SyncPage.dart';
import 'package:bitcoin_trading_app/bloc/CandleBloc.dart';
import 'package:bitcoin_trading_app/dashboard.dart';
import 'package:bitcoin_trading_app/retrofit/RestClient.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  var dio = Dio();
  dio.options.headers["Content-Type"] = "application/json";

  runApp(MyApp(dio));
}

class MyApp extends StatelessWidget {
  final dio;
  final restClient;

  MyApp(this.dio) : restClient = RestClient(dio);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => CandleBloc(restClient),
        )
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData.dark(),
        initialRoute: '/dashboard',
        routes: {
          '/dashboard': (context) => Dashboard(title: 'title'),
          '/syncpage': (context) => SyncPage(),
        },
      ),
    );
  }
}
