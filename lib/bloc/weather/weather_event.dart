import 'package:equatable/equatable.dart';

import 'package:flutter/material.dart';

@immutable
abstract class WeatherEvent extends Equatable {}

class FetchWeather extends WeatherEvent {
  @override
  List<Object?> get props => [];
}
