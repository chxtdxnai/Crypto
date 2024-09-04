import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'views/home_view.dart';
import 'view_models/home_view_model.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => CryptoViewModel()),
      ],
      child: MaterialApp(
        title: 'Crypto Converter',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: HomePage(),
      ),
    );
  }
}
