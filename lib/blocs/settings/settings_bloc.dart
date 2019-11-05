import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:grid_unlock/repositories/repositories.dart';

import '../blocs.dart';

class SettingsBloc extends Bloc<SettingsEvent, SettingsState> {
  @override
  SettingsState get initialState => SettingsState(primaryTheme(), false);

  @override
  Stream<SettingsState> mapEventToState(SettingsEvent event) async* {
    if (event is ThemeToggled) {
      ThemeData theme = state.darkMode ? primaryTheme() : nightTheme();
      bool darkMode = !state.darkMode;

      yield SettingsState(theme, darkMode);
    }
  }
}
