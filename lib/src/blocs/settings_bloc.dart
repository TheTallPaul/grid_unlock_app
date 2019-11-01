import 'dart:async';

import 'package:bloc/bloc.dart';

import 'blocs.dart';
import 'package:grid_unlock/src/repositories/style.dart';

class SettingsBloc extends Bloc<SettingsEvent, SettingsState> {
  @override
  SettingsState get initialState => SettingsState(theme: primaryTheme());

  @override
  Stream<SettingsState> mapEventToState(SettingsEvent event) async* {
    if (event is ThemeToggled) {
      yield SettingsState(
          theme: state.theme == primaryTheme() ? nightTheme() : primaryTheme());
    }
  }
}
