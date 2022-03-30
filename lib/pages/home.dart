import 'dart:async';

import 'package:flutter/material.dart';
import 'package:weather_app/components/body.dart';
import 'package:weather_app/models/forecast.dart';
import 'package:weather_app/services/weather_service.dart';

class HomePage extends StatefulWidget {
  static const String routeName = '/';
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  static const String cityName = 'Legnano';
  Future<Forecast> data = getWeather(cityName);

  @override
  void initState() {
    Timer.periodic(
      const Duration(minutes: 10),
      (Timer timer) {
        setState(() {
          data = getWeather(cityName);
        });
      },
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Colors.blue[500]!,
                  Colors.blue[900]!,
                ],
              ),
            ),
          ),
          FutureBuilder<Forecast>(
            future: data,
            builder: (
              BuildContext context,
              AsyncSnapshot<Forecast> snapshot,
            ) {
              if (snapshot.hasData) {
                final Forecast data = snapshot.data!;
                return Body(
                  data: data,
                  cityName: cityName,
                );
              }

              if (snapshot.hasError) {
                return Center(
                  child: SelectableText(
                    'Something went wrong: ${snapshot.error}\n'
                    'Try again!',
                  ),
                );
              }

              return const SizedBox.shrink();
            },
          ),
        ],
      ),
    );
  }
}
