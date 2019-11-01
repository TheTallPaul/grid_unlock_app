import 'package:flutter/material.dart';

import 'package:equatable/equatable.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:meta/meta.dart';

@immutable
abstract class MapState extends Equatable {
  const MapState();

  @override
  List<Object> get props => [];
}

class MapEmpty extends MapState {}

class MapLoading extends MapState {}

class MapLoaded extends MapState {
  const MapLoaded({this.markers}) : assert(markers != null);
  final Map<String, Marker> markers;

  @override
  List<Object> get props => [markers];
}

class MapError extends MapState {}
