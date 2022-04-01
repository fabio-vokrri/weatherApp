import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:weather_app/models/forecast.dart';

class WeatherIcon extends StatelessWidget {
  const WeatherIcon({
    Key? key,
    required this.data,
  }) : super(key: key);

  final Forecast data;

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Container(
      constraints: BoxConstraints.loose(const Size(300, 300)),
      child: SvgPicture.asset(
        'assets/icons/${data.iconId}.svg',
        color: Colors.white.withOpacity(0.8),
        height: size.height / 2.2,
      ),
    );
  }
}
