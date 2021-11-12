import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter/material.dart';

import '../bloc/theme/theme_bloc.dart';
import '../bloc/theme/theme_event.dart';

import './weather_page.dart';

class SearchPage extends StatelessWidget {
  SearchPage({Key? key}) : super(key: key);
  static const String routeName = "/search_page";
  final TextEditingController _searchTextController = TextEditingController();

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
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          const Icon(Icons.brightness_4_rounded),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            child: TextField(
              style: const TextStyle(
                color: Colors.black,
              ),
              autocorrect: false,
              controller: _searchTextController,
              decoration: const InputDecoration(
                hintText: 'Search cities',
                hintStyle: TextStyle(color: Colors.black),
                border: OutlineInputBorder(),
                filled: true,
                fillColor: Colors.white,
              ),
            ),
          ),
          ElevatedButton(
            onPressed: () {
              if (_searchTextController.text.isNotEmpty) {
                Navigator.pushNamed(
                  context,
                  WeatherPage.routeName,
                  arguments: _searchTextController.text,
                );
              }
            },
            child: const Text('Search'),
          ),
        ],
      ),
    );
  }
}
