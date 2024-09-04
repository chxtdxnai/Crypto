import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../view_models/home_view_model.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<CryptoViewModel>(
      builder: (context, viewModel, child) {
        return Scaffold(
          appBar: AppBar(
            title: Text('Crypto Converter'),
          ),
          body: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: <Widget>[
                SizedBox(height: 20),
                TextField(
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    labelText: 'Enter Amount',
                    border: OutlineInputBorder(),
                  ),
                  onChanged: (text) {
                    viewModel.setCryptoAmount(text);
                  },
                ),
                SizedBox(height: 20),
                DropdownButton<String>(
                  value: viewModel.selectedCrypto,
                  onChanged: (String? newValue) {
                    viewModel.setSelectedCrypto(newValue!);
                  },
                  items: viewModel.cryptos
                      .map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                ),
                SizedBox(height: 20),
                DropdownButton<String>(
                  value: viewModel.selectedCurrency,
                  onChanged: (String? newValue) {
                    viewModel.setSelectedCurrency(newValue!);
                  },
                  items: viewModel.conversionRates.keys
                      .map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                ),
                SizedBox(height: 20),
                Text(
                  'Converted Value: ${viewModel.convertedValue.toStringAsFixed(2)} ${viewModel.selectedCurrency}',
                  style: TextStyle(fontSize: 20),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
