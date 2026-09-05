# 💱 Currency Converter Pro

A modern, clean-architecture Flutter application for real-time currency conversion and live exchange rates tracking. Built with Provider for state management and integrated with ExchangeRate-API.

---

## ✨ Features

* **Live Exchange Rates:** View a comprehensive, real-time list of global currency rates based on a selected base currency.
* **Dual-Screen Architecture:** Separates the live market rates overview from the dedicated calculation/conversion screen.
* **Smart Currency Converter:** Seamlessly convert amounts with a built-in currency swap feature (`From` ⇄ `To`).
* **Quick Copy Result:** Copy the final converted amount directly to your clipboard with a single tap.
* **Modern Dark UI:** Designed with a professional, clean dark theme tailored for modern mobile experiences.
* **Clean Code Structure:** Built using proper modular separation (`models`, `services`, `providers`, `screens`, `widgets`, and `theme`).

---

## 🛠️ Tech Stack

* **Framework:** Flutter (Dart)
* **State Management:** Provider (`changeNotifier`)
* **Networking:** HTTP package
* **API:** [ExchangeRate-API](https://www.exchangerate-api.com/)
* **Local Storage:** SharedPreferences

---

## 📱 App Screenshots

| Live Rates Screen | Converter Screen |
| :---: | :---: |
| <img width="350" height="700" alt="currency_coverter_rates" src="https://github.com/user-attachments/assets/03a01ae9-bf81-494e-98ef-cb385078ed20" />
 | <img width="350" height="700" alt="currency_converter" src="https://github.com/user-attachments/assets/6cc40317-e076-4137-8490-7fdc631f737e" />
 |

---
lib/
│
├── models/         # Data models for parsing API responses
├── providers/      # State management logic (CurrencyProvider)
├── screens/        # Main UI views (RatesScreen, CurrencyScreen)
├── services/       # API calling and network services
├── theme/          # App color palette and dark theme definitions
└── widgets/        # Reusable UI components (CurrencyCard, ResultCard)

## 🚀 Getting Started

To get a local copy up and running, follow these simple steps:

1. **Clone the repository:**
   ```bash
   git clone [https://github.com/YOUR_USERNAME/currency_converter.git](https://github.com/YOUR_USERNAME/currency_converter.git)
