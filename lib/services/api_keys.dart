import 'dart:io';

enum Service {
  openWeatherMapService,
  unsplashService,
}

/// get the API key for the specified service from a file
Future<String> getKey({required Service api}) async {
  const String docPath =
      r'C:\Users\fabio\OneDrive - Politecnico di Milano\Programmazione\Flutter\weather_app\docs\api_keys.txt';
  final File docFile = File(docPath);

  if (api == Service.openWeatherMapService) return docFile.readAsLinesSync()[0];
  if (api == Service.unsplashService) return docFile.readAsLinesSync()[1];
  throw Exception('Wrong service required');
}