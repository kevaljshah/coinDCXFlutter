import 'dart:async';
import 'dart:convert';
import 'package:coindcxmarketapp/models/ticker_model.dart';
import 'package:coindcxmarketapp/network/request_provider.dart';

class TickerRepository {
  RequestProvider _provider = RequestProvider();

  Future<List<Ticker>> fetchTickerListData() async {
    final response = await _provider.get("/exchange/ticker");

    List<Ticker> tickers = (json.decode(response.body) as List)
        .map((data) => Ticker.fromJson(data))
        .toList();

    return tickers;
  }
}