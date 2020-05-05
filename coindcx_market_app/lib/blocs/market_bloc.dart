import 'dart:async';

import 'package:coindcxmarketapp/network/response.dart';
import 'package:coindcxmarketapp/repository/market_repository.dart';
import 'package:coindcxmarketapp/models/market_model.dart';

class MarketDetailsBloc {
  MarketRepository _marketDetailsRepository;
  StreamController _marketListController;

  StreamSink<Response<List<Market>>> get marketListSink =>
      _marketListController.sink;

  Stream<Response<List<Market>>> get marketListStream =>
      _marketListController.stream;

  MarketDetailsBloc() {
    _marketListController = StreamController<Response<List<Market>>>();
    _marketDetailsRepository = MarketRepository();
    fetchMarketDetails();
  }

  fetchMarketDetails() async {
    marketListSink.add(Response.loading('Getting Market Details.'));
    try {
      List<Market> marketDetails =
      await _marketDetailsRepository.fetchMarketListData();
      marketListSink.add(Response.completed(marketDetails));
    } catch (error) {
      marketListSink.add(Response.error(error.toString()));
      print(error);
    }
  }

  dispose() {
    _marketListController?.close();
  }
}