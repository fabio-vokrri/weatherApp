class Forecast {
  final String weather;
  final String description;
  final double temperature;
  final int pressure;
  final int humidity;
  final double windSpeed;
  final int windDirection;
  final int sunrise;
  final int sunset;
  final String iconId;

  const Forecast({
    required this.weather,
    required this.description,
    required this.temperature,
    required this.pressure,
    required this.humidity,
    required this.windSpeed,
    required this.windDirection,
    required this.sunrise,
    required this.sunset,
    required this.iconId,
  });

  static const double kelvin = 273.15;
  factory Forecast.fromJson(Map<String, dynamic> json) {
    return Forecast(
      weather: json['weather'][0]['main']! as String,
      description: json['weather'][0]['description']! as String,
      temperature:
          double.parse((json['main']['temp']! - kelvin).toStringAsFixed(2)),
      pressure: json['main']['pressure']! as int,
      humidity: json['main']['humidity']! as int,
      windSpeed: json['wind']['speed']! as double,
      windDirection: json['wind']['deg'] as int,
      sunrise: json['sys']['sunrise']! as int,
      sunset: json['sys']['sunset']! as int,
      iconId: json['weather'][0]['icon']! as String,
    );
  }

  @override
  String toString() {
    return '$temperature - $weather';
  }
}
