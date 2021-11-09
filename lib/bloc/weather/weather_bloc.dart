import 'package:bloc_app/repository/weather_repository.dart';

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
    emit(WeatherFetching());
    if (event is FetchWeather) {
      try {
        final WeatherModel weather =
            await weatherRepository.fetchWeatherData(event.city);
        emit(WeatherFetched(weather: weather));
      } catch (_) {
        emit(WeatherException());
      }
    }
  }
}
