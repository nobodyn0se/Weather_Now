import 'dart:async';
import 'dart:io';

import 'package:flutter_bloc/flutter_bloc.dart';

import './weather_event.dart';
import './weather_state.dart';

import '../../repository/weather_repository.dart';

import '../../weather_model/weather_model.dart';

class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  final WeatherRepository weatherRepository;

  WeatherBloc({required this.weatherRepository}) : super(WeatherNull()) {
    on<FetchWeather>(_onFetchWeather);
  }

  void _onFetchWeather(WeatherEvent event, Emitter<WeatherState> emit) async {
    if (event is FetchWeather) {
      emit(WeatherFetching());
      try {
        final WeatherModel weather =
            await weatherRepository.fetchWeatherData(event.city);
        emit(WeatherFetched(weather: weather));
      } on TimeoutException {
        emit(WeatherException(
            errorMessage: 'Session timed out! Try again later'));
      } on SocketException {
        emit(
            WeatherException(errorMessage: 'Looks like someone is offline :('));
      } on HttpException {
        emit(WeatherException(
            errorMessage: 'Whoa! Can\'t find the weather source'));
      } on FormatException {
        emit(WeatherException(errorMessage: 'Invalid response format'));
      } on StateError {
        emit(WeatherException(
            errorMessage: 'Oops! Bad state. No data received'));
      } catch (e) {
        emit(WeatherException(
            errorMessage: 'Error fetching the weather: ${e.toString()}'));
      }
    }
  }
}
