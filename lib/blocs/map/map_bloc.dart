import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:grid_unlock/repositories/repositories.dart';

import '../blocs.dart';

class MapBloc extends Bloc<MapEvent, MapState> {
  MapBloc(this.mapRepository, this.settingsBloc) {
    // Listeners
    _settingsSubscription = settingsBloc.listen((state) {
      add(UpdateMapTheme(state.darkMode));
    });
  }

  final MapRepository mapRepository;
  final SettingsBloc settingsBloc;
  StreamSubscription _settingsSubscription;
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
    Position position = await Geolocator()
        .getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
    GoogleMapController googleMapController = event.controller;
    await googleMapController.moveCamera(CameraUpdate.newCameraPosition(
        CameraPosition(
            target: LatLng(position.latitude, position.longitude),
            zoom: 16.0)));
    yield MapLoaded(googleMapController);
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
  Future<void> close() {
    // Cancel the subscription when the bloc closes
    _settingsSubscription?.cancel();
    return super.close();
  }
}
