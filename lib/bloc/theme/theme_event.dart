import 'package:flutter/cupertino.dart';

import 'package:equatable/equatable.dart';

@immutable
abstract class ThemeEvent extends Equatable {}

class ThemeToggled extends ThemeEvent {
  @override
  List<Object?> get props => [];
}
