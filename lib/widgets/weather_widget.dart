import 'package:flutter/material.dart';

import 'dart:math' as math;

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
                          Card(
                            color: Theme.of(context).scaffoldBackgroundColor,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                  'Low: ${weather.minTemp!.toStringAsFixed(2)} C'),
                            ),
                            shape: const RoundedRectangleBorder(
                              side: BorderSide(
                                color: Colors.lightBlue,
                              ),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(4)),
                            ),
                          ),
                          Card(
                            color: Theme.of(context).scaffoldBackgroundColor,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                  'High: ${weather.maxTemp!.toStringAsFixed(2)} C'),
                            ),
                            shape: const RoundedRectangleBorder(
                              side: BorderSide(
                                color: Colors.red,
                              ),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(4)),
                            ),
                          ),
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
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Card(
              color: Theme.of(context).scaffoldBackgroundColor,
              shape: const CircleBorder(
                side: BorderSide(
                  color: Colors.orangeAccent,
                  width: 4,
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(5.0),
                child: Transform.rotate(
                  child: const Icon(Icons.south, size: 45),
                  angle: (weather.windDirection! * math.pi / 180),
                ),
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            Text('${weather.windSpeed!.toStringAsFixed(2)} mph'),
          ],
        ),
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
