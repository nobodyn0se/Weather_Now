import '../weather_data/weather_data_layer.dart';
import '../weather_model/weather_model.dart';

class WeatherRepository {
  final WeatherDataClient weatherDataClient;

  WeatherRepository({required this.weatherDataClient});

  Future<WeatherModel> fetchWeatherData(String city) async {
    final int locID = await weatherDataClient.getLocID(city);
    return weatherDataClient.getWeatherData(locID);
  }
}
