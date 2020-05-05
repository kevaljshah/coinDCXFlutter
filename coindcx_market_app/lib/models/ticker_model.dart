class Ticker {
  String ask;
  String bid;
  String change24hour;
  String high;
  String lastPrice;
  String low;
  String market;
  int timestamp;
  String volume;

  Ticker({this.ask, this.bid, this.change24hour, this.high, this.lastPrice, this.low, this.market, this.timestamp, this.volume});

  factory Ticker.fromJson(Map<String, dynamic> json) {
    return Ticker(
      ask: json['ask'],
      bid: json['bid'],
      change24hour: json['change_24_hour'],
      high: json['high'],
      lastPrice: json['last_price'],
      low: json['low'],
      market: json['market'],
      timestamp: json['timestamp'],
      volume: json['volume'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['ask'] = this.ask;
    data['bid'] = this.bid;
    data['change_24_hour'] = this.change24hour;
    data['high'] = this.high;
    data['last_price'] = this.lastPrice;
    data['low'] = this.low;
    data['market'] = this.market;
    data['timestamp'] = this.timestamp;
    data['volume'] = this.volume;
    return data;
  }
}