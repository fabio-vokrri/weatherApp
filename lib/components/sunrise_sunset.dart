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
              sunset: widget.data.sunset,
              sunrise: widget.data.sunrise,
              now: DateTime.now(),
              color: Colors.blue[900]!,
            ),
          ),
          Center(
            child: Text(
              'Now: ${formatter.format(DateTime.now())}',
              style: textTheme.headline2,
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
                    formatter.format(widget.data.sunrise),
                    style: textTheme.bodyText2,
                  ),
                  const Spacer(),
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
