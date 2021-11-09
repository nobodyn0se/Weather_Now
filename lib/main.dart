import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:http/http.dart' as http;

import 'package:flutter/material.dart';

import '../bloc/theme/theme_state.dart';
import './bloc/theme/theme_bloc.dart';

import './bloc/weather/weather_bloc.dart';

import './repository/weather_repository.dart';
import './weather_data/weather_data_layer.dart';

import './widgets/main_page.dart';
import './widgets/weather_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);
  final WeatherRepository weatherRepository = WeatherRepository(
    weatherDataClient: WeatherDataClient(
      httpClient: http.Client(),
    ),
  );

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
            home: MainPage(),
            initialRoute: MainPage.routeName,
            routes: {
              MainPage.routeName: (context) => MainPage(),
              WeatherPage.routeName: (context) => const WeatherPage(),
            },
          );
        },
      ),
    );
  }
}
