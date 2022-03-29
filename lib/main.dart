import 'package:flutter/material.dart';

import 'pages/home.dart';

void main(List<String> args) {
  runApp(const Weather());
}

class Weather extends StatelessWidget {
  const Weather({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Weather',
      home: HomePage(),
    );
  }
}
