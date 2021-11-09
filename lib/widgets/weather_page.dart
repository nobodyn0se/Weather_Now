import 'package:bloc_app/bloc/theme/theme_event.dart';
import 'package:bloc_app/bloc/weather/weather_bloc.dart';
import 'package:bloc_app/bloc/weather/weather_event.dart';
import 'package:bloc_app/bloc/weather/weather_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class WeatherPage extends StatefulWidget {
  static const routeName = '/weather_page';
  const WeatherPage({Key? key}) : super(key: key);

  @override
  State<WeatherPage> createState() => _WeatherPageState();
}

class _WeatherPageState extends State<WeatherPage> {
  late String city;
}
