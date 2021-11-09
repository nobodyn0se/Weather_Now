import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:http/http.dart' as http;

import 'package:flutter/material.dart';

import '../bloc/theme/theme_state.dart';
import './bloc/theme/theme_bloc.dart';

import './bloc/weather/weather_bloc.dart';

import './repository/weather_repository.dart';
import './weather_data/weather_data_layer.dart';

import './widgets/main_page.dart';

void main() {
  final WeatherRepository weatherRepository = WeatherRepository(
    weatherDataClient: WeatherDataClient(
      httpClient: http.Client(),
    ),
  );
  runApp(MyApp(
    weatherRepository: weatherRepository,
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key, required this.weatherRepository}) : super(key: key);
  final WeatherRepository weatherRepository;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<ThemeBloc>(
          create: (context) => ThemeBloc(),
        ),
        BlocProvider<WeatherBloc>(
            create: (context) =>
                WeatherBloc(weatherRepository: weatherRepository))
      ],
      child: BlocBuilder<ThemeBloc, ThemeState>(
        builder: (context, state) {
          return MaterialApp(
            title: 'Flutter Demo',
            theme: state.themeData,
            home: const MainPage(),
            initialRoute: MainPage.routeName,
            routes: {
              MainPage.routeName: (context) => const MainPage(),
            },
          );
        },
      ),
    );
  }
}
