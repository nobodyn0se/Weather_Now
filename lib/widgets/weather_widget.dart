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
    return SizedBox(
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
                  color: Colors.transparent,
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
                            color:
                                Theme.of(context).textTheme.bodyText1!.color!),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.symmetric(vertical: 4),
                      height: weather.humidity! * 0.01 * 250,
                      width: 27,
                    decoration: BoxDecoration(
                        color: Theme.of(context).secondaryHeaderColor),
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: Text(
                      '${weather.humidity.toString()}\n%',
                      textAlign: TextAlign.center,
                    ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
