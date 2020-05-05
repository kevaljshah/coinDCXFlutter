class Market {
    String baseCurrencyName;
    int baseCurrencyPrecision;
    String baseCurrencyShortName;
    String coindcxName;
    String ecode;
    double maxLeverage;
    double maxLeverageShort;
    double maxPrice;
    double maxQuantity;
    double minNotional;
    double minPrice;
    double minQuantity;
    List<String> orderTypes;
    String pair;
    String status;
    double step;
    String symbol;
    String targetCurrencyName;
    int targetCurrencyPrecision;
    String targetCurrencyShortName;

    Market(
        {
          this.baseCurrencyName,
          this.baseCurrencyPrecision,
          this.baseCurrencyShortName,
          this.coindcxName,
          this.ecode,
          this.maxLeverage,
          this.maxLeverageShort,
          this.maxPrice,
          this.maxQuantity,
          this.minNotional,
          this.minPrice,
          this.minQuantity,
          this.orderTypes,
          this.pair,
          this.status,
          this.step,
          this.symbol,
          this.targetCurrencyName,
          this.targetCurrencyPrecision,
          this.targetCurrencyShortName
        }
        );

    factory Market.fromJson(Map<String, dynamic> json) {
        return Market(
            baseCurrencyName: json['base_currency_name'],
            baseCurrencyPrecision: json['base_currency_precision'],
            baseCurrencyShortName: json['base_currency_short_name'],
            coindcxName: json['coindcx_name'],
            ecode: json['ecode'], 
            maxLeverage: json['max_leverage'],
            maxLeverageShort: json['max_leverage_short'],
            maxPrice: json['max_price'],
            maxQuantity: json['max_quantity'],
            minNotional: json['min_notional'],
            minPrice: json['min_price'],
            minQuantity: json['min_quantity'],
            orderTypes: json['order_types'] != null ? new List<String>.from(json['order_types']) : null,
            pair: json['pair'], 
            status: json['status'], 
            step: json['step'], 
            symbol: json['symbol'], 
            targetCurrencyName: json['target_currency_name'],
            targetCurrencyPrecision: json['target_currency_precision'],
            targetCurrencyShortName: json['target_currency_short_name'],
        );
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = new Map<String, dynamic>();
        data['base_currency_name'] = this.baseCurrencyName;
        data['base_currency_precision'] = this.baseCurrencyPrecision;
        data['base_currency_short_name'] = this.baseCurrencyShortName;
        data['coindcx_name'] = this.coindcxName;
        data['ecode'] = this.ecode;
        data['max_leverage'] = this.maxLeverage;
        data['max_price'] = this.maxPrice;
        data['max_quantity'] = this.maxQuantity;
        data['min_notional'] = this.minNotional;
        data['min_price'] = this.minPrice;
        data['min_quantity'] = this.minQuantity;
        data['pair'] = this.pair;
        data['status'] = this.status;
        data['step'] = this.step;
        data['symbol'] = this.symbol;
        data['target_currency_name'] = this.targetCurrencyName;
        data['target_currency_precision'] = this.targetCurrencyPrecision;
        data['target_currency_short_name'] = this.targetCurrencyShortName;
        data['max_leverage_short'] = this.maxLeverageShort;
        if (this.orderTypes != null) {
            data['order_types'] = this.orderTypes;
        }
        return data;
    }
}