import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:weather_app/models/forecast.dart';
import 'package:weather_app/services/weather_service.dart';

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
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
              height: size.height / 2,
              child: Image.network(
                getIcon(iconId: data.iconId),
                fit: BoxFit.cover,
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  cityName!.toUpperCase(),
                  style: Theme.of(context).textTheme.headline2,
                ),
                Text(
                  '${data.description} - ${data.temperature}°C',
                  style: Theme.of(context).textTheme.headline2,
                ),
              ],
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text(
              'Humidity: ${data.humidity}%',
              style: Theme.of(context).textTheme.headline4,
            ),
            Text(
              'Pressure: ${data.pressure}',
              style: Theme.of(context).textTheme.headline4,
            ),
            Text(
              'Wind Speed: ${data.windSpeed}',
              style: Theme.of(context).textTheme.headline4,
            ),
            Transform.rotate(
              angle: data.windDirection.toDouble() - 180,
              child: SvgPicture.asset('assets/icons/arrow-up.svg'),
            )
          ],
        ),
      ],
    );
  }
}
