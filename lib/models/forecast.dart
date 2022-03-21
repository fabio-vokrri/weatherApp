class Forecast {
  final String cityName;
  final String weather;
  final double temperature;
  final double windSpeed;
  final int sunrise;
  final int sunset;

  const Forecast({
    required this.cityName,
    required this.weather,
    required this.temperature,
    required this.windSpeed,
    required this.sunrise,
    required this.sunset,
  });

  static const double kelvin = 273.15;
  factory Forecast.fromJson(Map<String, dynamic> json) {
    return Forecast(
      cityName: json["name"]! as String,
      weather: json["weather"][0]["main"]! as String,
      temperature:
          double.parse((json["main"]["temp"]! - kelvin).toStringAsFixed(1)),
      windSpeed: json["wind"]["speed"]! as double,
      sunrise: json["sys"]["sunrise"]! as int,
      sunset: json["sys"]["sunset"]! as int,
    );
  }

  @override
  String toString() {
    return '$cityName: $temperature - $weather';
  }
}
