import 'package:flutter/material.dart';

import 'package:weather_app/components/sunrise_sunset.dart';
import 'package:weather_app/components/weather_icon.dart';
import 'weather_information.dart';

import 'package:weather_app/models/forecast.dart';

class Body extends StatelessWidget {
  const Body({
    Key? key,
    required this.data,
    required this.cityName,
  }) : super(key: key);

  final Forecast data;
  final String? cityName;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(height: 96),
          LayoutBuilder(
              builder: (BuildContext context, BoxConstraints constraints) {
            final double width = constraints.maxWidth;
            const double minWidth = 700;
            bool _isColumn = width > minWidth;
            if (width > minWidth) {
              return Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  WeatherIcon(data: data),
                  const SizedBox(width: 32.0),
                  WeatherInformation(
                    cityName: cityName,
                    data: data,
                    isColumn: _isColumn,
                  ),
                ],
              );
            } else {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  WeatherIcon(data: data),
                  WeatherInformation(
                    cityName: cityName,
                    data: data,
                    isColumn: _isColumn,
                  ),
                ],
              );
            }
          }),
          const SizedBox(height: 64.0),
          SunriseSunset(data: data),
        ],
      ),
    );
  }
}
