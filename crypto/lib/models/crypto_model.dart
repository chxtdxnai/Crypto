import 'dart:convert';
import 'package:http/http.dart' as http;

class CryptoModel {
  final List<String> cryptos = [
    'bitcoin',
    'ethereum',
    'dogecoin',
    'litecoin',
    'ripple',
    'cardano',
    'polkadot',
    'chainlink',
    'stellar',
    'uniswap'
  ];

  Future<Map<String, double>> fetchConversionRates(
      String selectedCrypto) async {
    final url = Uri.parse(
        'https://api.coingecko.com/api/v3/simple/price?ids=${cryptos.join(",")}&vs_currencies=thb,usd,eur,jpy,gbp,aud,cad,chf,cny,hkd');
    try {
      final response = await http.get(url);
      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        return {
          'THB': data[selectedCrypto]['thb']?.toDouble() ?? 0.0,
          'USD': data[selectedCrypto]['usd']?.toDouble() ?? 0.0,
          'EUR': data[selectedCrypto]['eur']?.toDouble() ?? 0.0,
          'JPY': data[selectedCrypto]['jpy']?.toDouble() ?? 0.0,
          'GBP': data[selectedCrypto]['gbp']?.toDouble() ?? 0.0,
          'AUD': data[selectedCrypto]['aud']?.toDouble() ?? 0.0,
          'CAD': data[selectedCrypto]['cad']?.toDouble() ?? 0.0,
          'CHF': data[selectedCrypto]['chf']?.toDouble() ?? 0.0,
          'CNY': data[selectedCrypto]['cny']?.toDouble() ?? 0.0,
          'HKD': data[selectedCrypto]['hkd']?.toDouble() ?? 0.0,
        };
      } else {
        throw Exception(
            'Failed to load conversion rates, status code: ${response.statusCode}');
      }
    } catch (e) {
      print('Error fetching conversion rates: $e');
      return {}; // Return empty map on error
    }
  }
}
