import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../blocs.dart';

class MapBloc extends Bloc<MapEvent, MapState> {
  MapBloc(this.settingsBloc) {
    // Listeners
    _settingsSubscription = settingsBloc.listen((state) {
      add(UpdateMapTheme(state.darkMode));
    });
  }

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
    } else if (event is UpdateRiderDestination) {
      yield* _mapUpdateRiderDestinationToState(event);
    }
  }

  Stream<MapState> _mapMapCreatedToState(MapCreated event) async* {
    final Position position = await Geolocator()
        .getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
    final double user_latitude = position.latitude;
    final double user_longitude = position.longitude;
    final GoogleMapController googleMapController = event.controller;

    await googleMapController.moveCamera(CameraUpdate.newCameraPosition(
        CameraPosition(
            target: LatLng(user_latitude, user_longitude), zoom: 16.0)));
    yield MapLoaded(googleMapController, user_latitude, user_longitude);
  }

  Stream<MapState> _mapUpdateMapThemeToState(UpdateMapTheme event) async* {
    if (state is MapLoaded) {
      final GoogleMapController mapController =
          (state as MapLoaded).mapController;
      final double user_latitude = (state as MapLoaded).user_latitude;
      final double user_longitude = (state as MapLoaded).user_longitude;

      await rootBundle
          .loadString(event.darkMode ? nighttimeFilepath : daytimeFilepath)
          .then((mapStyle) {
        // Set the style
        mapController.setMapStyle(mapStyle);
      });

      yield MapLoaded(mapController, user_latitude, user_longitude);
    }
  }

  Stream<MapState> _mapUpdateRiderDestinationToState(
      UpdateRiderDestination event) async* {
    if (state is MapLoaded) {
      final Position position = await Geolocator()
          .getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
      final double user_latitude = position.latitude;
      final double user_longitude = position.longitude;
      final GoogleMapController mapController =
          (state as MapLoaded).mapController;

      await mapController.moveCamera(CameraUpdate.newCameraPosition(
          CameraPosition(
              target: LatLng(user_latitude, user_longitude), zoom: 16.0)));
    }
  }

  @override
  Future<void> close() {
    // Cancel the subscription when the bloc closes
    _settingsSubscription?.cancel();
    return super.close();
  }
}
