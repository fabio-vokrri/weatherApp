import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:weather_app/components/app_bar.dart';
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
  String? cityName;

  void searchCity(String input) {
    setState(() => cityName = input);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: CustomAppBar(searchCity: searchCity),
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
          cityName == null
              ? const Center(
                  child: Text('Search the weather in your city!'),
                )
              : FutureBuilder<Forecast>(
                  future: getWeather(cityName: cityName),
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

                    return const Center(child: CircularProgressIndicator());
                  },
                ),
        ],
      ),
    );
  }
}
