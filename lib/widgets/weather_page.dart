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
          if (weatherState is WeatherNull) {
            return const Text('No data to display');
          } else if (weatherState is WeatherFetching) {
            return const CircularProgressIndicator();
          } else if (weatherState is WeatherFetched &&
              weatherState.weather.currTemp != null) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(city),
                Text('Current: ${weatherState.weather.currTemp}'),
                Text('Low: ${weatherState.weather.minTemp}'),
                Text('High: ${weatherState.weather.maxTemp}'),
                Text('Humidity: ${weatherState.weather.humidity}%')
              ],
            );
          } else {
            return const Text('Error while fetching weather');
          }
        }),
      ),
    );
  }
}
