import 'dart:async';

import 'package:coindcxmarketapp/network/response.dart';
import 'package:coindcxmarketapp/repository/ticker_repository.dart';
import 'package:coindcxmarketapp/models/ticker_model.dart';

class TickerBloc {
  TickerRepository _tickerRepository;
  StreamController _tickerController;

  StreamSink<Response<List<Ticker>>> get tickerSink =>
      _tickerController.sink;

  Stream<Response<List<Ticker>>> get tickerStream =>
      _tickerController.stream;

  TickerBloc() {
    _tickerController = StreamController<Response<List<Ticker>>>();
    _tickerRepository = TickerRepository();
    fetchTickerDetails();
  }

  fetchTickerDetails() async {
    tickerSink.add(Response.loading('Getting Ticker Details.'));
    try {
      List<Ticker> tickers =
      await _tickerRepository.fetchTickerListData();
      tickerSink.add(Response.completed(tickers));
    } catch (error) {
      tickerSink.add(Response.error(error.toString()));
      print(error);
    }
  }

  dispose() {
    _tickerController?.close();
  }
}