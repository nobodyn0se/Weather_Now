import 'dart:io';

import 'package:http/http.dart' as http;

class WeatherDataClient {
  static const String _mainURL = 'https://metaweather.com';
  final http.Client httpClient;

  WeatherDataClient({required this.httpClient});

  Future<int> getLocID(String city) async {
    final locURL = Uri.parse('$_mainURL/api/location/search/?query=$city');
    try {
      final locResponse = await httpClient.get(locURL);
      if (locResponse.statusCode == 200) {
        final locResult = jsonDecode(locResponse.body) as List;
        return (locResult.first)['woeid'];
      }
    } catch (e) {
      print('Error occured in data_layer/getLocID: ${e.toString()}');
      return -1;
    }
    return -1;
  }
}
