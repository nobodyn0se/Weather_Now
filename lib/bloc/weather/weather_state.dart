import 'package:equatable/equatable.dart';

import 'package:flutter/material.dart';

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
  final Icon weatherIcon;

  WeatherFetched({required this.weather, required this.weatherIcon});

  @override
  List<Object?> get props => [weather, weatherIcon];
}

class WeatherException extends WeatherState {
  final String errorMessage;

  WeatherException({required this.errorMessage});

  @override
  List<Object?> get props => [errorMessage];
}
