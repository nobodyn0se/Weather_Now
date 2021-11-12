import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter/material.dart';

import '../bloc/theme/theme_bloc.dart';
import '../bloc/theme/theme_event.dart';

import '../bloc/weather/weather_bloc.dart';
import '../bloc/weather/weather_event.dart';
import '../bloc/weather/weather_state.dart';

import '../widgets/weather_widget.dart';

class WeatherPage extends StatefulWidget {
  static const routeName = '/weather_page';
  const WeatherPage({Key? key}) : super(key: key);

  @override
  State<WeatherPage> createState() => _WeatherPageState();
}

class _WeatherPageState extends State<WeatherPage> {
  late String city;
  @override
  void didChangeDependencies() {
    city = ModalRoute.of(context)!.settings.arguments as String;
    BlocProvider.of<WeatherBloc>(context).add(FetchWeather(city: city));
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: <Widget>[
          IconButton(
            onPressed: () {
              BlocProvider.of<ThemeBloc>(context).add(ThemeToggled());
            },
            icon: const Icon(Icons.lightbulb_rounded),
          )
        ],
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      extendBodyBehindAppBar: true,
      body: Center(
        child: BlocBuilder<WeatherBloc, WeatherState>(
            builder: (context, weatherState) {
          if (weatherState is WeatherFetching) {
            return const CircularProgressIndicator();
          } else if (weatherState is WeatherFetched &&
              weatherState.weather.currTemp != null) {
            return WeatherWidget(
              weather: weatherState.weather,
              weatherIcon: weatherState.weatherIcon,
            );
          } else if (weatherState is WeatherException) {
            return Text(weatherState.errorMessage);
          } else {
            return const Text('Nothing to display');
          }
        }),
      ),
    );
  }
}
