import 'dart:io';

/// get the API key for the specified service from a file
Future<String> getKey() async {
  const String docPath =
      r'C:\Users\fabio\OneDrive - Politecnico di Milano\Programmazione\Flutter\weather_app\docs\api_keys.txt';
  final File docFile = File(docPath);

  return docFile.readAsLinesSync()[0];
}
