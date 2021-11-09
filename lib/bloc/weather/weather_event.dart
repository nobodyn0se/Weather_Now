import 'package:equatable/equatable.dart';

import 'package:flutter/material.dart';

@immutable
abstract class WeatherEvent extends Equatable {}

class FetchWeather extends WeatherEvent {
  final String city;

  FetchWeather({required this.city});

  @override
  List<Object?> get props => [city];
}
