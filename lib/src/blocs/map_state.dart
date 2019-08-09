import 'package:flutter/material.dart';

import 'package:equatable/equatable.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:meta/meta.dart';

@immutable
abstract class MapState extends Equatable {
  MapState([List props = const []]) : super(props);
}

class MapEmpty extends MapState {}

class MapLoading extends MapState {}

class MapLoaded extends MapState {
  MapLoaded({@required this.markers})
      : assert(markers != null),
        super([markers]);

  final Map<String, Marker> markers;
}

class MapError extends MapState {}
