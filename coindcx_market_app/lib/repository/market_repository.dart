import 'dart:async';
import 'dart:convert';
import 'package:coindcxmarketapp/models/market_model.dart';
import 'package:coindcxmarketapp/network/request_provider.dart';

class MarketRepository {
  RequestProvider _provider = RequestProvider();

  Future<List<Market>> fetchMarketListData() async {
    final response = await _provider.get("/exchange/v1/markets_details");

    List<Market> marketDetails = (json.decode(response.body) as List)
        .map((data) => Market.fromJson(data))
        .toList();

    return marketDetails;
  }
}