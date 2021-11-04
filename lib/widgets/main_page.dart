import 'package:bloc_app/app_themes/app_themes.dart';
import 'package:bloc_app/bloc/theme/theme_event.dart';
import 'package:bloc_app/bloc/theme/theme_state.dart';
import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/theme/theme_bloc.dart';

class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: <Widget>[
          IconButton(
              onPressed: () {}, icon: const Icon(Icons.lightbulb_rounded))
        ],
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      extendBodyBehindAppBar: true,
      body: const Center(
        child: Text('MainPage'),
      ),
    );
  }
}
