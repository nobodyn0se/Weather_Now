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

}
