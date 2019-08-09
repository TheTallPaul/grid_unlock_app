import 'dart:async';

import 'package:flutter/material.dart';
import 'package:bloc/bloc.dart';

import 'package:grid_unlock/src/widgets/widgets.dart';
import 'blocs.dart';

class ThemeBloc extends Bloc<ThemeEvent, ThemeData> {
  @override
  ThemeData get initialState => primaryTheme();

  @override
  Stream<ThemeData> mapEventToState(ThemeEvent event) async* {
    switch (event) {
      case ThemeEvent.toggle:
        yield currentState == primaryTheme() ? primaryTheme() : nightTheme();
        break;
    }
  }
}
