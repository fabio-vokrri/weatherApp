import 'dart:async';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:weather_app/models/forecast.dart';
import 'package:weather_app/ui/semicircle.dart';

class SunriseSunset extends StatefulWidget {
  const SunriseSunset({
    Key? key,
    required this.data,
  }) : super(key: key);

  final Forecast data;

  @override
  State<SunriseSunset> createState() => _SunriseSunsetState();
}

class _SunriseSunsetState extends State<SunriseSunset> {
  final formatter = DateFormat('Hm');
  late Forecast data;

  @override
  void initState() {
    Timer.periodic(
      const Duration(seconds: 1),
      (Timer timer) => setState(() {}),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;
    return SizedBox(
      height: 300,
      width: 400,
      child: Stack(
        alignment: Alignment.center,
        children: [
          const CustomPaint(
            size: Size(300, 300),
            painter: SemiCircle(color: Colors.white54),
          ),
          CustomPaint(
            size: const Size(300, 300),
            painter: Progress(
              sunset: widget.data.sunset,
              sunrise: widget.data.sunrise,
              now: DateTime.now(),
              color: Colors.blue[900]!,
            ),
          ),
          Positioned(
            bottom: 110,
            child: SizedBox(
              width: 340,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    formatter.format(widget.data.sunrise),
                    style: textTheme.bodyText2,
                  ),
                  Text(
                    'Now: ${formatter.format(DateTime.now())}',
                    style: textTheme.headline3,
                  ),
                  Text(
                    formatter.format(widget.data.sunset),
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
