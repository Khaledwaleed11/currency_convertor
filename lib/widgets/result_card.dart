import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import '../provider/currency_provider.dart';
import '../theme/app_theme.dart';

class ResultCard extends StatelessWidget {
  const ResultCard({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<CurrencyProvider>(context);
    final rate = provider.currencyModel?.rates[provider.toCurrency] ?? 0.0;

    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: AppTheme.cardBg,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: AppTheme.primaryColor.withOpacity(0.2)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: .spaceBetween,
            children: [
              const Text(
                'Result',
                style: TextStyle(color: AppTheme.subTextColor),
              ),
              IconButton(
                icon: const Icon(
                  Icons.copy,
                  color: AppTheme.primaryColor,
                  size: 18,
                ),
                onPressed: () {
                  final text =
                      '${provider.convertedValue.toStringAsFixed(4)} ${provider.toCurrency}';
                  Clipboard.setData(ClipboardData(text: text));
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Copied!'),
                      duration: Duration(milliseconds: 600),
                    ),
                  );
                },
              ),
            ],
          ),
          Text(
            '${provider.convertedValue.toStringAsFixed(4)} ${provider.toCurrency}',
            style: const TextStyle(
              color: AppTheme.textColor,
              fontSize: 30,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            '1 ${provider.fromCurrency} = ${rate.toStringAsFixed(4)} ${provider.toCurrency}',
            style: const TextStyle(color: AppTheme.primaryColor, fontSize: 13),
          ),
        ],
      ),
    );
  }
}
