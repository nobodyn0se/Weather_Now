import 'dart:convert';

import 'package:http/http.dart' as http;

import '../weather_model/weather_model.dart';

class WeatherDataClient {
  static const String _mainURL = 'https://www.metaweather.com';
  final http.Client httpClient;

  WeatherDataClient({required this.httpClient});

  Future<int> getLocID(String city) async {
    final locURL = Uri.parse('$_mainURL/api/location/search/?query=$city');
    final locResponse = await httpClient.get(locURL);
    if (locResponse.statusCode == 200) {
      final locResult = jsonDecode(locResponse.body);
      return (locResult.first)['woeid'];
    }
    return -1;
  }

  Future<WeatherModel> getWeatherData(int locID) async {
    final weatherURL = Uri.parse('$_mainURL/api/location/$locID');
    final weatherResponse = await httpClient.get(weatherURL);
    if (weatherResponse.statusCode == 200) {
      final weatherResult = jsonDecode(weatherResponse.body);
      return WeatherModel.fromJson(weatherResult);
    }
    return WeatherModel();
  }
}
