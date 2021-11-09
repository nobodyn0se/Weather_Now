import 'package:equatable/equatable.dart';

import '../../weather_model/weather_model.dart';

abstract class WeatherState extends Equatable {}

class WeatherNull extends WeatherState {
  @override
  List<Object?> get props => [];
}

class WeatherFetching extends WeatherState {
  @override
  List<Object?> get props => [];
}

class WeatherFetched extends WeatherState {
  final WeatherModel weather;

  WeatherFetched({required this.weather});

  @override
  List<Object?> get props => [weather];
}

class WeatherException extends WeatherState {
  @override
  List<Object?> get props => [];
}
