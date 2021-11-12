import 'package:flutter/material.dart';

import '../weather_model/weather_model.dart';

class WeatherWidget extends StatelessWidget {
  const WeatherWidget({
    Key? key,
    required this.city,
    required this.weather,
  }) : super(key: key);

  final String city;
  final WeatherModel weather;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        RichText(
          textAlign: TextAlign.center,
          text: TextSpan(
            style: Theme.of(context).textTheme.headline4,
            children: <TextSpan>[
              TextSpan(
                text: '$city\n',
              ),
              TextSpan(
                text: weather.weatherCondition,
                style: Theme.of(context).textTheme.caption,
              ),
            ],
          ),
        ),
        SizedBox(
          width: 300,
          height: 250,
          child: Row(
            children: [
              Expanded(
                child: Card(
                  elevation: 0,
                  color: Theme.of(context).scaffoldBackgroundColor,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Text(
                        '${weather.currTemp!.toStringAsFixed(2)} \u2103',
                        style: Theme.of(context).textTheme.headline3,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          Text('Low: ${weather.minTemp!.toStringAsFixed(2)} C'),
                          Text(
                              'High: ${weather.maxTemp!.toStringAsFixed(2)} C'),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              createHumidityMeter(context),
            ],
          ),
        ),
        Text('Air Pressure: ${weather.airPressure!.toInt()} hPa'),
      ],
    );
  }

  Stack createHumidityMeter(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: <Widget>[
        Container(
          margin: const EdgeInsets.symmetric(vertical: 3),
          height: 250,
          width: 30,
          decoration: BoxDecoration(
            color: Theme.of(context).primaryColor,
            border: Border.all(
                color: Theme.of(context).textTheme.bodyText1!.color!),
          ),
        ),
        Container(
          margin: const EdgeInsets.symmetric(vertical: 4),
          height: weather.humidity! * 0.01 * 250,
          width: 27,
          decoration:
              BoxDecoration(color: Theme.of(context).secondaryHeaderColor),
        ),
        Align(
          alignment: Alignment.center,
          child: Text(
            '${weather.humidity.toString()}\n%',
            textAlign: TextAlign.center,
          ),
        ),
      ],
    );
  }
}
