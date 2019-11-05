import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

@immutable
abstract class MapEvent extends Equatable {
  const MapEvent();
}

class MapCreated extends MapEvent {
  const MapCreated(this.controller);

  final GoogleMapController controller;

  @override
  List<Object> get props => [controller];
}

class UpdateMapTheme extends MapEvent {
  const UpdateMapTheme(this.darkMode);

  final bool darkMode;

  @override
  List<Object> get props => [darkMode];
}
