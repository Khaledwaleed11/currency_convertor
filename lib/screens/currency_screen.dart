import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/currency_provider.dart';
import '../theme/app_theme.dart';
import '../widgets/currency_card.dart';
import '../widgets/result_card.dart';

class CurrencyScreen extends StatelessWidget {
  const CurrencyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.scaffoldBg,
      appBar: AppBar(
        backgroundColor: AppTheme.scaffoldBg,
        elevation: 0,
        surfaceTintColor: Colors.transparent,
        title: const Text(
          'Currency Converter Pro',
          style: TextStyle(
            color: Colors.white,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(
              Icons.refresh_rounded,
              color: AppTheme.primaryColor,
            ),
            onPressed: () {
              final provider = Provider.of<CurrencyProvider>(
                context,
                listen: false,
              );
              provider.fetchRates(provider.fromCurrency);
            },
          ),
        ],
      ),
      body: Consumer<CurrencyProvider>(
        builder: (context, provider, child) {
          if (provider.isLoading && provider.currencyModel == null) {
            return const Center(
              child: CircularProgressIndicator(color: AppTheme.primaryColor),
            );
          }

          return const SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            padding: EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [CurrencyCard(), SizedBox(height: 20), ResultCard()],
            ),
          );
        },
      ),
    );
  }
}
