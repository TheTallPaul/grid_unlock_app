import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:meta/meta.dart';

@immutable
abstract class MapState extends Equatable {
  const MapState(this.markers);

  final Set<Marker> markers;

  @override
  List<Object> get props => [];

  @override
  String toString() {
    return '''MapState { 
      markers: $markers,
    }''';
  }
}

class MapLoading extends MapState {
  const MapLoading(Set<Marker> markers) : super(markers);

  @override
  String toString() {
    return '''MapLoading { 
      markers: $markers,
    }''';
  }
}

class MapLoaded extends MapState {
  const MapLoaded(this.mapController, this.user_latitude, this.user_longitude,
      Set<Marker> markers)
      : super(markers);

  final GoogleMapController mapController;
  final double user_latitude;
  final double user_longitude;

  @override
  List<Object> get props =>
      [mapController, user_latitude, user_longitude, markers];

  @override
  String toString() {
    return '''MapLoaded { 
      mapController: ${mapController.toString()},
      user_latitude: $user_latitude,
      user_longitude: $user_longitude,
      markers: $markers,
    }''';
  }
}

class MapError extends MapState {
  const MapError(Set<Marker> markers) : super(markers);

  @override
  String toString() {
    return '''MapError { 
      markers: $markers,
    }''';
  }
}
