import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:weather_app/models/forecast.dart';
import 'package:weather_app/services/string_extension.dart';

class WeatherInformation extends StatelessWidget {
  const WeatherInformation({
    Key? key,
    required this.cityName,
    required this.data,
  }) : super(key: key);

  final String? cityName;
  final Forecast data;

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          cityName!.toUpperCase(),
          style: textTheme.headline1,
        ),
        Text(
          '${data.description.capitalize()} - ${data.temperature}°C',
          style: textTheme.headline2,
        ),
        Text(
          'Humidity: ${data.humidity}%',
          style: textTheme.headline3,
        ),
        Text(
          'Pressure: ${data.pressure} hPa',
          style: textTheme.headline3,
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'Wind Speed: ${data.windSpeed} m/s',
              style: textTheme.headline3,
            ),
            const SizedBox(width: 16),
            Transform.rotate(
              angle: data.windDirection.toDouble() - 90,
              child: SvgPicture.asset(
                'assets/icons/arrow.svg',
                color: Colors.white70,
                height: 24,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
