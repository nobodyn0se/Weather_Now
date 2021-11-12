import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:http/http.dart' as http;

import 'package:flutter/material.dart';

import '../bloc/theme/theme_state.dart';
import './bloc/theme/theme_bloc.dart';

import './bloc/weather/weather_bloc.dart';

import './repository/weather_repository.dart';
import './weather_data/weather_data_layer.dart';

import './pages/main_page.dart';
import './pages/weather_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final WeatherRepository weatherRepository = WeatherRepository(
    weatherDataClient: WeatherDataClient(
      httpClient: http.Client(),
    ),
  );

  @override
  void dispose() {
    weatherRepository.weatherDataClient.httpClient.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<ThemeBloc>(
          create: (context) => ThemeBloc(),
        ),
        BlocProvider<WeatherBloc>(
            lazy: false,
            create: (context) =>
                WeatherBloc(weatherRepository: weatherRepository))
      ],
      child: BlocBuilder<ThemeBloc, ThemeState>(
        builder: (context, themeState) {
          return MaterialApp(
            title: 'Flutter Demo',
            theme: themeState.themeData,
            initialRoute: SearchPage.routeName,
            routes: {
              SearchPage.routeName: (context) => SearchPage(),
              WeatherPage.routeName: (context) => const WeatherPage(),
            },
          );
        },
      ),
    );
  }
}
