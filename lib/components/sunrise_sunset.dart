import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:weather_app/models/forecast.dart';
import 'package:weather_app/ui/semicircle.dart';

class SunriseSunset extends StatelessWidget {
  SunriseSunset({
    Key? key,
    required this.data,
  }) : super(key: key);

  final Forecast data;

  final formatter = DateFormat('Hm');

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;
    return SizedBox(
      height: 300,
      width: 300,
      child: Stack(
        children: [
          const CustomPaint(
            size: Size(300, 300),
            painter: SemiCircle(color: Colors.white54),
          ),
          CustomPaint(
            size: const Size(300, 300),
            painter: Progress(
              sunset: data.sunset,
              sunrise: data.sunrise,
              now: DateTime.now(),
              color: Colors.blue[900]!,
            ),
            child: Center(
              child: Text(
                formatter.format(DateTime.now()),
                style: textTheme.headline3,
              ),
            ),
          ),
          Positioned(
            bottom: 115,
            child: SizedBox(
              width: 300,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    formatter.format(data.sunrise),
                    style: textTheme.bodyText2,
                  ),
                  const Spacer(),
                  Text(
                    formatter.format(data.sunset),
                    style: textTheme.bodyText2,
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
