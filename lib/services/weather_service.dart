import 'dart:convert';
import 'package:http/http.dart';
import 'package:weather_app/models/forecast.dart';

/// Get the current weather for the specified city form OpenWeatherMap API
Future<Forecast> getWeather({required String cityName}) async {
  const String key = 'e3bdec638538ea74153528f5f891949b';
  final Uri url = Uri.parse(
    "https://api.openweathermap.org/data/2.5/weather?q=$cityName&appid=$key",
  );

  final Response response = await get(url);
  if (response.statusCode != 200) throw ClientException('fuck!');
  final jsonResponse = jsonDecode(response.body);
  return Forecast.fromJson(jsonResponse);
}
