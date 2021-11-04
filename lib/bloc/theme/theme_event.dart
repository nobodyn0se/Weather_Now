import 'package:bloc_app/app_themes/app_themes.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

@immutable
abstract class ThemeEvent extends Equatable {}

class ThemeToggled extends ThemeEvent {
  @override
  List<Object?> get props => [];
}
