import 'package:flutter/material.dart';
import 'package:weather_app/models/forecast.dart';
import 'package:weather_app/services/weather_service.dart';

class HomePage extends StatefulWidget {
  static const String routeName = '/';
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String cityName = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(cityName),
      ),
      body: cityName == ''
          ? Center(
              child: TextField(
                onSubmitted: (String input) {
                  setState(() => cityName = input);
                },
              ),
            )
          : FutureBuilder<Forecast>(
              future: getWeather(cityName: cityName),
              builder:
                  (BuildContext context, AsyncSnapshot<Forecast> snapshot) {
                if (snapshot.hasData) {
                  final Forecast data = snapshot.data!;
                  return Center(
                    child: Column(
                      children: [
                        Text(data.weather),
                        Text('${data.temperature}'),
                      ],
                    ),
                  );
                }

                if (snapshot.hasError) {
                  return const Center(
                    child: Text('Something went wrong'),
                  );
                }

                return const Center(child: CircularProgressIndicator());
              },
            ),
    );
  }
}
