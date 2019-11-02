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
  const MapLoaded(this.mapController);

  final GoogleMapController mapController;

  @override
  List<Object> get props => [mapController];
}

class MapError extends MapState {}
