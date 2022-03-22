import 'package:flutter/material.dart';
import 'package:weather_app/models/forecast.dart';
import 'package:weather_app/services/image_service.dart';
import 'package:weather_app/services/weather_service.dart';

class HomePage extends StatefulWidget {
  static const String routeName = '/';
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String cityName = '';
  String imageBaseUrl = 'http://openweathermap.org/img/wn/';

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Weather Forecast'),
        actions: [
          Container(
            width: size.width / 3,
            height: kToolbarHeight,
            padding:
                const EdgeInsets.symmetric(horizontal: 16.0, vertical: 4.0),
            color: Colors.white30,
            child: TextFormField(
              decoration: const InputDecoration(
                hintText: 'Search city',
                border: InputBorder.none,
                icon: Icon(Icons.search),
              ),
              onFieldSubmitted: (String? input) {
                setState(() => cityName = input!);
              },
            ),
          ),
        ],
      ),
      body: cityName == ''
          ? const Center(
              child: Text(
                'Search weather forecast for your city',
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
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.network(
                          getIcon(iconId: data.iconId),
                        ),
                        Text(data.weather),
                        Text('${data.temperature}'),
                      ],
                    ),
                  );
                }

                if (snapshot.hasError) {
                  return Center(
                    child: SelectableText(
                      'Something went wrong: ${snapshot.error}',
                    ),
                  );
                }

                return const Center(child: CircularProgressIndicator());
              },
            ),
    );
  }
}
