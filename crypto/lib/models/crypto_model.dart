import '../services/crypto_service.dart';

class CryptoModel {
  final List<String> cryptos = [
    'bitcoin',
    'ethereum',
    'litecoin',
    'ripple',
    'cardano',
    'polkadot',
    'dogecoin',
    'chainlink',
    'stellar',
    'usd-coin',
  ];

  final CryptoService _cryptoService = CryptoService();

  Future<Map<String, double>> fetchConversionRates(
      String selectedCrypto) async {
    return await _cryptoService.fetchConversionRates(selectedCrypto, cryptos);
  }
}
