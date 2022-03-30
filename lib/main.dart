import 'package:flutter/material.dart';
import 'package:weather_app/theme.dart';

import 'pages/home.dart';

void main(List<String> args) {
  runApp(const Weather());
}

class Weather extends StatelessWidget {
  const Weather({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Weather',
      home: const HomePage(),
      theme: theme,
    );
  }
}
