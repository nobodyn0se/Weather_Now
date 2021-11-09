import 'dart:io';

import 'package:http/http.dart' as http;

class WeatherDataClient {
  static const String _mainURL = 'https://metaweather.com';
  final http.Client httpClient;

  WeatherDataClient({required this.httpClient});
}
