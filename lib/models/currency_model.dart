class CurrencyModel {
  final String baseCurrency;
  final String date;
  final Map<String, double> rates;

  CurrencyModel({
    required this.baseCurrency,
    required this.date,
    required this.rates,
  });

  factory CurrencyModel.fromJson(Map<String, dynamic> json) {
    Map<String, double> rateMap = {};
    if (json['conversion_rates'] != null) {
      json['conversion_rates'].forEach((key, value) {
        rateMap[key] = (value as num).toDouble();
      });
    }

    return CurrencyModel(
      baseCurrency: json['base_code'] ?? 'USD',
      date: json['time_last_update_utc'] ?? '',
      rates: rateMap,
    );
  }
}
