// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'RestClient.dart';

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

class _RestClient implements RestClient {
  _RestClient(this._dio, {this.baseUrl}) {
    baseUrl ??= 'http://localhost:8080';
  }

  final Dio _dio;

  String? baseUrl;

  @override
  Future<ResponseDayCandleDtoV1> getDayCandleV1(market, count) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{
      r'market': market,
      r'count': count
    };
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<ResponseDayCandleDtoV1>(
            Options(method: 'GET', headers: <String, dynamic>{}, extra: _extra)
                .compose(_dio.options, '/candles/day-candle/v1',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = ResponseDayCandleDtoV1.fromJson(_result.data!);
    return value;
  }

  @override
  Future<ResponseGetMinuteCandleDtoV1> getMinuteCandleV1(
      unit, market, count) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{
      r'market': market,
      r'count': count
    };
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<ResponseGetMinuteCandleDtoV1>(
            Options(method: 'GET', headers: <String, dynamic>{}, extra: _extra)
                .compose(_dio.options, '/candles/minute-candle/v1/$unit',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = ResponseGetMinuteCandleDtoV1.fromJson(_result.data!);
    return value;
  }

  @override
  Future<ResponsePostSyncDayCandleDtoV1> postSyncDayCandleV1(
      market, to, count) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{
      r'market': market,
      r'to': to,
      r'count': count
    };
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<ResponsePostSyncDayCandleDtoV1>(
            Options(method: 'POST', headers: <String, dynamic>{}, extra: _extra)
                .compose(_dio.options, '/sync/day-candle/v1',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = ResponsePostSyncDayCandleDtoV1.fromJson(_result.data!);
    return value;
  }

  @override
  Future<ResponsePostSyncMinuteCandleDtoV1> postSyncMinuteCandleV1(
      unit, market, to, count) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{
      r'market': market,
      r'to': to,
      r'count': count
    };
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<ResponsePostSyncMinuteCandleDtoV1>(
            Options(method: 'POST', headers: <String, dynamic>{}, extra: _extra)
                .compose(_dio.options, '/sync/minute-candle/v1/$unit',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = ResponsePostSyncMinuteCandleDtoV1.fromJson(_result.data!);
    return value;
  }

  @override
  Future<ResponseMarketCodeDtoV1> getMarketCodeV1() async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<ResponseMarketCodeDtoV1>(
            Options(method: 'GET', headers: <String, dynamic>{}, extra: _extra)
                .compose(_dio.options, '/candles/market-code/v1',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = ResponseMarketCodeDtoV1.fromJson(_result.data!);
    return value;
  }

  RequestOptions _setStreamType<T>(RequestOptions requestOptions) {
    if (T != dynamic &&
        !(requestOptions.responseType == ResponseType.bytes ||
            requestOptions.responseType == ResponseType.stream)) {
      if (T == String) {
        requestOptions.responseType = ResponseType.plain;
      } else {
        requestOptions.responseType = ResponseType.json;
      }
    }
    return requestOptions;
  }
}
