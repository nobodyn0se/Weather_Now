import 'package:bloc_app/bloc/theme/theme_bloc.dart';
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
          if (weatherState is WeatherFetching) {
            return const CircularProgressIndicator();
          } else if (weatherState is WeatherFetched &&
              weatherState.weather.currTemp != null) {
            return Container(
              //color: Colors.red,
              width: 300,
              height: 500,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  SizedBox(
                    width: double.maxFinite,
                    child: Card(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8.0),
                        child: Text(
                          city,
                          style: Theme.of(context).textTheme.headline5,
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  ),
                  IntrinsicHeight(
                    child: Row(
                      children: [
                        Expanded(
                          child: Card(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: <Widget>[
                                Text(
                                    'Current: ${weatherState.weather.currTemp!.toStringAsFixed(2)} C'),
                                Text(
                                    'Low: ${weatherState.weather.minTemp!.toStringAsFixed(2)} C'),
                                Text(
                                    'High: ${weatherState.weather.maxTemp!.toStringAsFixed(2)} C'),
                                Text(
                                    'Humidity: ${weatherState.weather.humidity}%'),
                                Text(
                                    'Air Pressure: ${weatherState.weather.airPressure!.toInt()} hPa'),
                              ],
                            ),
                          ),
                        ),
                        Stack(
                          alignment: Alignment.bottomCenter,
                          children: <Widget>[
                            Container(
                              margin: const EdgeInsets.symmetric(vertical: 3),
                              height: 250,
                              width: 30,
                              decoration: BoxDecoration(
                                color: Theme.of(context).primaryColor,
                                border: Border.all(
                                    color: Theme.of(context)
                                        .textTheme
                                        .bodyText1!
                                        .color!),
                              ),
                            ),
                            Container(
                              margin: const EdgeInsets.symmetric(vertical: 4),
                              height:
                                  weatherState.weather.humidity! * 0.01 * 250,
                              width: 27,
                              decoration:
                                  BoxDecoration(color: Colors.lightBlue[100]),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
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
