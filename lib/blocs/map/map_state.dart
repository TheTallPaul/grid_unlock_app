import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:meta/meta.dart';

@immutable
abstract class MapState extends Equatable {
  const MapState();

  @override
  List<Object> get props => [];
}

class MapLoading extends MapState {}

class MapLoaded extends MapState {
  const MapLoaded(this.mapController, this.user_latitude, this.user_longitude);

  final GoogleMapController mapController;
  final double user_latitude;
  final double user_longitude;

  @override
  List<Object> get props => [mapController];

  @override
  String toString() {
    return '''MapLoaded { 
      mapController: ${mapController.toString()},
      user_latitude: $user_latitude,
      user_longitude: $user_longitude,
    }''';
  }
}

class MapError extends MapState {}
