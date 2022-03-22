import 'dart:convert';
import 'dart:math';

import 'package:http/http.dart';
import 'package:weather_app/services/api_keys.dart';

/// get a random image of the specified weather from Unsplash API
Future<String> getImage({required String weather}) async {
  final String key = await getKey(api: Service.unsplashService);
  List<String> photosUrl = [];
  String query;

  switch (weather) {
    case 'Clear':
      query = 'sun';
      break;
    case 'Drizzle':
      query = 'drizzle';
      break;
    case 'Rain':
      query = 'rain';
      break;
    case 'Snow':
      query = 'snow';
      break;
    case 'Mist':
    case 'Smoke':
    case 'Haze':
    case 'Dust':
    case 'Fog':
    case 'Sand':
    case 'Ash':
    case 'Squall':
      query = 'fog';
      break;
    case 'Clouds':
      query = 'clouds';
      break;
    case 'Thunderstorm':
      query = 'thunderstorm';
      break;
    default:
      query = 'clear';
  }

  final Uri url = Uri.parse(
    'https://api.unsplash.com/search/photos?query=$query'
    '&color=black_and_white&client_id=$key',
  );

  final Response response = await get(url);
  if (response.statusCode != 200) throw ClientException('fuck!');

  final Map<String, dynamic> jsonResponse = jsonDecode(response.body);
  for (Map<String, dynamic> entry in jsonResponse["results"]) {
    photosUrl.add(entry["urls"]["full"]);
  }

  final int randomIndex = Random().nextInt(photosUrl.length);

  return photosUrl[randomIndex];
}
