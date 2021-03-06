import 'package:flutter/material.dart';

import 'dart:math' as math;

import 'package:weather_icons/weather_icons.dart';

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
          Padding(
            //Start of header display
            padding: const EdgeInsets.symmetric(horizontal: 12.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
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
                    Icon(
                      weatherIcon,
                      size: 30,
                    ),
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
          ),
          SizedBox(
            //Start of temp display
            width: 350,
            height: 200,
            child: Card(
              elevation: 0,
              color: Theme.of(context).scaffoldBackgroundColor,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  createTempMeter(context),
                  Text(
                    '${weather.currTemp!.toStringAsFixed(2)} \u2103',
                    style: Theme.of(context).textTheme.headline3,
                  ),
                  createHumidityMeter(context),
                ],
              ),
            ),
          ),
          Divider(
            color: Theme.of(context).textTheme.bodyText1!.color,
            indent: 0.1 * screenWidth,
            endIndent: 0.1 * screenWidth,
            height: 0,
          ),
          IntrinsicHeight(
            child: Row(
              //Start of wind data display
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
                VerticalDivider(
                  color: Theme.of(context).textTheme.bodyText1!.color,
                  thickness: 1,
                  width: 25,
                ),
                // Text('Air Pressure: ${weather.airPressure!.toInt()} hPa\n'
                //     'Visibility: ${weather.visibility!.toStringAsFixed(2)} miles'),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: <Widget>[
                        const Icon(
                          WeatherIcons.barometer,
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Text('${weather.airPressure!.toInt()} hPa'),
                      ],
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        const Icon(
                          Icons.visibility_outlined,
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Text('${weather.visibility!.toStringAsFixed(2)} miles'),
                      ],
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

  Row createTempMeter(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(right: 4.0),
          child: Card(
            color: Theme.of(context).scaffoldBackgroundColor,
            elevation: 0,
            child: Padding(
              padding: const EdgeInsets.all(3.0),
              child: Text(
                weather.minTemp!.toStringAsFixed(1),
                style: Theme.of(context).textTheme.subtitle1,
              ),
            ),
            shape: const RoundedRectangleBorder(
              side: BorderSide(
                color: Colors.lightBlue,
              ),
            ),
          ),
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
        Padding(
          padding: const EdgeInsets.only(left: 4.0),
          child: Card(
            color: Theme.of(context).scaffoldBackgroundColor,
            elevation: 0,
            child: Padding(
              padding: const EdgeInsets.all(3.0),
              child: Text(
                weather.maxTemp!.toStringAsFixed(1),
                style: Theme.of(context).textTheme.subtitle1,
              ),
            ),
            shape: const RoundedRectangleBorder(
              side: BorderSide(
                color: Colors.red,
              ),
            ),
          ),
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
            height: 25,
            width: 250,
            decoration: BoxDecoration(
              color: Theme.of(context).primaryColor,
              border: Border.all(
                  color: Theme.of(context).textTheme.bodyText1!.color!),
            ),
          ),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 4),
            height: 22,
            width: weather.humidity! * 0.01 * 250,
            decoration:
                BoxDecoration(color: Theme.of(context).secondaryHeaderColor),
          ),
          Align(
            alignment: Alignment.center,
            child: Text(
              '${weather.humidity.toString()}%',
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}
