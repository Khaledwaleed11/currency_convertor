import 'package:flutter/foundation.dart';

import '../models/currency_model.dart';
import '../services/currency_service.dart';

class CurrencyProvider extends ChangeNotifier {
  final CurrencyService _service = CurrencyService();

  bool isLoading = false;
  CurrencyModel? currencyModel;

  String fromCurrency = 'USD';
  String toCurrency = 'EGP';
  double amount = 1.0;
  double convertedValue = 0.0;

  List<String> get availableCurrencies =>
      currencyModel?.rates.keys.toList() ?? [];

  Future<void> fetchRates(String base) async {
    isLoading = true;
    notifyListeners();

    fromCurrency = base;
    currencyModel = await _service.fetchRates(base);

    isLoading = false;
    calculateExchange();
    notifyListeners();
  }

  void setFromCurrency(String currency) {
    if (fromCurrency != currency) {
      fetchRates(currency);
    }
  }

  void setToCurrency(String currency) {
    toCurrency = currency;
    calculateExchange();
    notifyListeners();
  }

  void setAmount(double newAmount) {
    amount = newAmount;
    calculateExchange();
    notifyListeners();
  }

  void calculateExchange() {
    if (currencyModel != null && currencyModel!.rates.containsKey(toCurrency)) {
      final rate = currencyModel!.rates[toCurrency]!;
      convertedValue = amount * rate;
    } else {
      convertedValue = 0.0;
    }
  }
}
