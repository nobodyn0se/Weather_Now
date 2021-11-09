class WeatherModel {
  final String weatherCondition;
  final double minTemp;
  final double maxTemp;
  final double currTemp;
  final double windSpeed;
  final double windDirection;
  final double airPressure;
  final double humidity;
  final double visibility;

  WeatherModel(
      {required this.airPressure,
      required this.currTemp,
      required this.humidity,
      required this.maxTemp,
      required this.minTemp,
      required this.visibility,
      required this.weatherCondition,
      required this.windDirection,
      required this.windSpeed});

  factory WeatherModel.fromJson(dynamic json) {
    final initWeather = json['consolidated_weather'][0];
    return WeatherModel(
        airPressure: initWeather['air_pressure'],
        currTemp: initWeather['the_temp'],
        humidity: initWeather['humidity'],
        maxTemp: initWeather['max_temp'],
        minTemp: initWeather['min_temp'],
        visibility: initWeather['visibility'],
        weatherCondition: initWeather['weather_state_name'],
        windDirection: initWeather['wind_direction'],
        windSpeed: initWeather['wind_speed']);
  }
}
