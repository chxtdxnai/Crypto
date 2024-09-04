import 'package:flutter/material.dart';
import '../models/crypto_model.dart';

class CryptoViewModel extends ChangeNotifier {
  final CryptoModel _model = CryptoModel();
  double _convertedValue = 0.0;
  String _selectedCurrency = 'THB';
  String _selectedCrypto = 'bitcoin';
  Map<String, double> _conversionRates = {};
  List<String> _cryptos = [];
  String _cryptoAmount = '';

  CryptoViewModel() {
    _cryptos = _model.cryptos;
    _fetchConversionRates();
  }

  double get convertedValue => _convertedValue;
  String get selectedCurrency => _selectedCurrency;
  String get selectedCrypto => _selectedCrypto;
  List<String> get cryptos => _cryptos;
  Map<String, double> get conversionRates => _conversionRates;

  void setSelectedCrypto(String crypto) {
    _selectedCrypto = crypto;
    _fetchConversionRates();
  }

  void setSelectedCurrency(String currency) {
    _selectedCurrency = currency;
    _convert();
  }

  void setCryptoAmount(String amount) {
    _cryptoAmount = amount;
    double cryptoAmount = double.tryParse(amount) ?? 0;
    _convertedValue = cryptoAmount * (_conversionRates[_selectedCurrency] ?? 0);
    notifyListeners();
  }

  Future<void> _fetchConversionRates() async {
    _conversionRates = await _model.fetchConversionRates(_selectedCrypto);
    _convert();
    notifyListeners();
  }

  void _convert() {
    double cryptoAmount = double.tryParse(_cryptoAmount) ?? 0;
    _convertedValue = cryptoAmount * (_conversionRates[_selectedCurrency] ?? 0);
    notifyListeners();
  }
}
