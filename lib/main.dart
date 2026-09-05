import 'package:currency_convertor/provider/currency_provider.dart';
import 'package:currency_convertor/screens/rates_screen.dart'; // الشاشة الرئيسية الجديدة
import 'package:currency_convertor/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => CurrencyProvider()..fetchRates('USD'),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: AppTheme.darkTheme,
        home: const RatesScreen(),
      ),
    ),
  );
}
