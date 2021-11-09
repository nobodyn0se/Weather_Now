import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter/material.dart';

import '../bloc/theme/theme_bloc.dart';
import '../bloc/theme/theme_event.dart';

class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);
  static const String routeName = "/search_page";

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
        children: <Widget>[
          const Icon(Icons.brightness_4_rounded),
          TextField(
            autocorrect: false,
            decoration: InputDecoration(
              hintText: 'Search cities',
              hintStyle: Theme.of(context).textTheme.bodyText1,
              border: const OutlineInputBorder(),
              fillColor: Theme.of(context).textTheme.bodyText1!.color,
            ),
          ),
        ],
      ),
    );
  }
}
