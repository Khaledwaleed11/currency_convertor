import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/currency_provider.dart';
import '../theme/app_theme.dart';

class CurrencyCard extends StatelessWidget {
  const CurrencyCard({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<CurrencyProvider>(context);

    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: AppTheme.cardBg,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Colors.white.withOpacity(0.05)),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TextField(
            keyboardType: const TextInputType.numberWithOptions(decimal: true),
            style: const TextStyle(
              color: AppTheme.textColor,
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
            decoration: InputDecoration(
              labelText: 'Amount',
              labelStyle: const TextStyle(color: AppTheme.subTextColor),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide(color: Colors.white.withOpacity(0.1)),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: const BorderSide(
                  color: AppTheme.primaryColor,
                  width: 2,
                ),
              ),
              filled: true,
              fillColor: AppTheme.scaffoldBg,
            ),
            onChanged: (value) {
              final amount = double.tryParse(value) ?? 0.0;
              provider.setAmount(amount);
            },
          ),
          const SizedBox(height: 20),
          Row(
            children: [
              Expanded(
                child: _buildDropdown(
                  context,
                  label: 'From',
                  selected: provider.fromCurrency,
                  items: provider.availableCurrencies,
                  onChanged: (val) {
                    if (val != null) provider.setFromCurrency(val);
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: CircleAvatar(
                  backgroundColor: AppTheme.scaffoldBg,
                  child: IconButton(
                    icon: const Icon(
                      Icons.swap_horiz,
                      color: AppTheme.primaryColor,
                    ),
                    onPressed: () {
                      String temp = provider.fromCurrency;
                      provider.setFromCurrency(provider.toCurrency);
                      provider.setToCurrency(temp);
                    },
                  ),
                ),
              ),
              Expanded(
                child: _buildDropdown(
                  context,
                  label: 'To',
                  selected: provider.toCurrency,
                  items: provider.availableCurrencies,
                  onChanged: (val) {
                    if (val != null) provider.setToCurrency(val);
                  },
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildDropdown(
    BuildContext context, {
    required String label,
    required String selected,
    required List<String> items,
    required ValueChanged<String?> onChanged,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(color: AppTheme.subTextColor, fontSize: 12),
        ),
        const SizedBox(height: 6),
        Container(
          height: 50,
          padding: const EdgeInsets.symmetric(horizontal: 12),
          decoration: BoxDecoration(
            color: AppTheme.scaffoldBg,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: Colors.white.withOpacity(0.1)),
          ),
          child: DropdownButtonHideUnderline(
            child: DropdownButton<String>(
              isExpanded: true,
              value: items.contains(selected) ? selected : null,
              dropdownColor: AppTheme.cardBg,
              icon: const Icon(
                Icons.arrow_drop_down,
                color: AppTheme.primaryColor,
              ),
              style: const TextStyle(
                color: AppTheme.textColor,
                fontWeight: FontWeight.bold,
              ),
              items: items.isEmpty
                  ? [DropdownMenuItem(value: selected, child: Text(selected))]
                  : items.map((String cur) {
                      return DropdownMenuItem<String>(
                        value: cur,
                        child: Text(cur, overflow: TextOverflow.ellipsis),
                      );
                    }).toList(),
              onChanged: onChanged,
            ),
          ),
        ),
      ],
    );
  }
}
