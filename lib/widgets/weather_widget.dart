import 'package:flutter/material.dart';

import 'dart:math' as math;

import '../weather_model/weather_model.dart';

class WeatherWidget extends StatelessWidget {
  const WeatherWidget({
    Key? key,
    required this.weather,
    required this.weatherIcon,
  }) : super(key: key);

  final WeatherModel weather;
  final IconData weatherIcon;

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return SafeArea(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: 70,
                child: RichText(
                  text: TextSpan(
                    style: Theme.of(context).textTheme.headline4,
                    children: <TextSpan>[
                      TextSpan(
                        text: '${weather.city}\n',
                      ),
                      TextSpan(
                        text: '${weather.country}\n',
                        style: Theme.of(context).textTheme.headline6,
                      ),
                    ],
                  ),
                ),
              ),
              Wrap(
                children: <Widget>[
                  Icon(weatherIcon),
                  Text(
                    weather.weatherCondition!,
                    style: Theme.of(context).textTheme.caption,
                  ),
                ],
                direction: Axis.vertical,
                spacing: 15,
                crossAxisAlignment: WrapCrossAlignment.center,
              ),
            ],
          ),
          Divider(
            color: Theme.of(context).textTheme.bodyText1!.color,
            indent: 0.1 * screenWidth,
            endIndent: 0.1 * screenWidth,
          ),
          SizedBox(
            width: 350,
            height: 200,
            child: Card(
              elevation: 0,
              color: Theme.of(context).scaffoldBackgroundColor,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  createTempMeter(context),
                  Text(
                    '${weather.currTemp!.toStringAsFixed(2)} \u2103',
                    style: Theme.of(context).textTheme.headline3,
                  ),
                  // Row(
                  //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  //   children: <Widget>[
                  //     Card(
                  //       color: Theme.of(context).scaffoldBackgroundColor,
                  //       child: Padding(
                  //         padding: const EdgeInsets.all(8.0),
                  //         child: Text(
                  //             'Low: ${weather.minTemp!.toStringAsFixed(2)} C'),
                  //       ),
                  //       shape: const RoundedRectangleBorder(
                  //         side: BorderSide(
                  //           color: Colors.lightBlue,
                  //         ),
                  //         borderRadius:
                  //             BorderRadius.all(Radius.circular(4)),
                  //       ),
                  //     ),
                  //     Card(
                  //       color: Theme.of(context).scaffoldBackgroundColor,
                  //       child: Padding(
                  //         padding: const EdgeInsets.all(8.0),
                  //         child: Text(
                  //             'High: ${weather.maxTemp!.toStringAsFixed(2)} C'),
                  //       ),
                  //       shape: const RoundedRectangleBorder(
                  //         side: BorderSide(
                  //           color: Colors.red,
                  //         ),
                  //         borderRadius:
                  //             BorderRadius.all(Radius.circular(4)),
                  //       ),
                  //     ),
                  //   ],
                  // ),
                ],
              ),
            ),
          ),
          Divider(
            color: Theme.of(context).textTheme.bodyText1!.color,
            indent: 0.1 * screenWidth,
            endIndent: 0.1 * screenWidth,
          ),
          Text('Air Pressure: ${weather.airPressure!.toInt()} hPa\n'
              'Visibility: ${weather.visibility!.toStringAsFixed(2)} miles'),
          Divider(
            color: Theme.of(context).textTheme.bodyText1!.color,
            indent: 0.1 * screenWidth,
            endIndent: 0.1 * screenWidth,
          ),
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
              Text(
                '${weather.windSpeed!.toStringAsFixed(2)} mph',
                style: const TextStyle(
                  fontSize: 20,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Row createTempMeter(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(
          weather.minTemp!.toStringAsFixed(1),
        ),
        Stack(
          alignment: Alignment.centerRight,
          children: <Widget>[
            Container(
              decoration: BoxDecoration(
                border: Border.all(
                    color: Theme.of(context).textTheme.bodyText1!.color!),
                gradient: const LinearGradient(
                  colors: [
                    Colors.white,
                    Colors.lightBlue,
                    Colors.blue,
                    Colors.green,
                    Colors.yellow,
                    Colors.orange,
                    Colors.deepOrange,
                    Colors.red,
                    Colors.brown,
                  ],
                  stops: [0.05, 0.2, 0.3, 0.45, 0.6, 0.65, 0.7, 0.75, 0.8],
                ),
              ),
              height: 10,
              width: 240,
            ),
            Container(
              color: Theme.of(context).primaryColor,
              height: 10,
              width: (240 - (weather.currTemp! + 50) * 2),
            ),
          ],
        ),
        Text(
          weather.maxTemp!.toStringAsFixed(1),
        ),
      ],
    );
  }

  SizedBox createHumidityMeter(BuildContext context) {
    return SizedBox(
      width: 250,
      child: Stack(
        alignment: Alignment.centerLeft,
      children: <Widget>[
        Container(
            margin: const EdgeInsets.symmetric(horizontal: 3),
            height: 30,
            width: 250,
          decoration: BoxDecoration(
            color: Theme.of(context).primaryColor,
            border: Border.all(
                color: Theme.of(context).textTheme.bodyText1!.color!),
          ),
        ),
        Container(
            margin: const EdgeInsets.symmetric(horizontal: 4),
            height: 27,
            width: weather.humidity! * 0.01 * 250,
          decoration:
              BoxDecoration(color: Theme.of(context).secondaryHeaderColor),
        ),
        Align(
          alignment: Alignment.center,
          child: Text(
              weather.humidity.toString(),
            textAlign: TextAlign.center,
          ),
        ),
      ],
      ),
    );
  }
}
