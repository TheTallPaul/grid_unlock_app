import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:grid_unlock/repositories/repositories.dart';

import '../blocs.dart';

class MapBloc extends Bloc<MapEvent, MapState> {
  MapBloc(this.mapRepository, this.settingsBloc) {
    // Listeners
    settingsSubscription = settingsBloc.listen((state) {
      add(UpdateMapTheme(state.darkMode));
    });
  }

  final MapRepository mapRepository;
  final SettingsBloc settingsBloc;
  StreamSubscription settingsSubscription;
  static const daytimeFilepath = 'assets/maps/daytime_map_style.json';
  static const nighttimeFilepath = 'assets/maps/nighttime_map_style.json';

  @override
  MapState get initialState => MapLoading();

  @override
  Stream<MapState> mapEventToState(MapEvent event) async* {
    if (event is MapCreated) {
      yield* _mapMapCreatedToState(event);
    } else if (event is UpdateMapTheme) {
      yield* _mapUpdateMapThemeToState(event);
    }
  }

  Stream<MapState> _mapMapCreatedToState(MapCreated event) async* {
    yield MapLoaded(event.controller);
  }

  Stream<MapState> _mapUpdateMapThemeToState(UpdateMapTheme event) async* {
    if (state is MapLoaded) {
      GoogleMapController mapController = (state as MapLoaded).mapController;

      await rootBundle
          .loadString(event.darkMode ? nighttimeFilepath : daytimeFilepath)
          .then((mapStyle) {
        // Set the style
        mapController.setMapStyle(mapStyle);
      });

      yield MapLoaded(mapController);
    }
  }

  @override
  void close() {
    // Cancel the subscription when the bloc closes
    settingsSubscription.cancel();
    super.close();
  }
}
