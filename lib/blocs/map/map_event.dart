import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:google_maps_webservice/places.dart';

@immutable
abstract class MapEvent extends Equatable {
  const MapEvent();
}

class MapCreated extends MapEvent {
  const MapCreated(this.controller);

  final GoogleMapController controller;

  @override
  List<Object> get props => [controller];

  @override
  String toString() {
    return 'MapCreated { controller: $controller }';
  }
}

class UpdateMapTheme extends MapEvent {
  const UpdateMapTheme(this.darkMode);

  final bool darkMode;

  @override
  List<Object> get props => [darkMode];

  @override
  String toString() {
    return 'UpdateMapTheme { darkMode: $darkMode }';
  }
}

class UpdateRiderDestination extends MapEvent {
  const UpdateRiderDestination(this.destination);

  final Prediction destination;

  @override
  List<Object> get props => [destination];

  @override
  String toString() {
    return 'UpdateRiderDestination { destination: $destination }';
  }
}
