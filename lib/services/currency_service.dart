import 'dart:convert';

import 'package:http/http.dart' as http;

import '../models/currency_model.dart';

class CurrencyService {
  final String apiKey = '77b102fd3f70bb8afee10341';

  Future<CurrencyModel?> fetchRates(String baseCurrency) async {
    try {
      final url = Uri.parse(
        'https://v6.exchangerate-api.com/v6/$apiKey/latest/$baseCurrency',
      );
      final response = await http.get(url);

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        return CurrencyModel.fromJson(data);
      } else {
        throw Exception('Failed to load exchange rates');
      }
    } catch (e) {
      print('Error: $e');
      return null;
    }
  }
}
