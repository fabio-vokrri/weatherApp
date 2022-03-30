import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:weather_app/components/sunrise_sunset.dart';
import 'package:weather_app/models/forecast.dart';
import 'weather_information.dart';

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
    final Size size = MediaQuery.of(context).size;
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              constraints: BoxConstraints.loose(const Size(300, 300)),
              child: SvgPicture.asset(
                'assets/icons/${data.iconId}.svg',
                color: Colors.white.withOpacity(0.8),
                height: size.height / 2.2,
              ),
            ),
            const SizedBox(width: 32.0),
            WeatherInformation(cityName: cityName, data: data),
          ],
        ),
        const SizedBox(height: 32.0),
        SunriseSunset(data: data),
      ],
    );
  }
}
