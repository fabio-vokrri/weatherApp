import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:weather_app/models/forecast.dart';
import 'package:weather_app/services/weather_service.dart';
import 'package:weather_app/services/string_extension.dart';

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
            SvgPicture.asset(
              'assets/icons/${data.iconId}.svg',
              color: Colors.black54,
              height: size.height / 2,
            ),
            const SizedBox(width: 16.0),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  cityName!.toUpperCase(),
                  style: Theme.of(context).textTheme.headline2,
                ),
                Text(
                  '${data.description.capitalize()} - ${data.temperature}°C',
                  style: Theme.of(context).textTheme.headline2,
                ),
                Text(
                  'Humidity: ${data.humidity}%',
                  style: Theme.of(context).textTheme.headline4,
                ),
                Text(
                  'Pressure: ${data.pressure} hPa',
                  style: Theme.of(context).textTheme.headline4,
                ),
                Row(
                  children: [
                    Text(
                      'Wind Speed: ${data.windSpeed} m/s',
                      style: Theme.of(context).textTheme.headline4,
                    ),
                    const SizedBox(width: 16),
                    Transform.rotate(
                      angle: data.windDirection.toDouble() - 90,
                      child: SvgPicture.asset(
                        'assets/icons/arrow.svg',
                        color: Colors.black54,
                        height: 32,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
