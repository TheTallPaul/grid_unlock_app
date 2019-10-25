import 'package:flutter/material.dart';

import 'package:equatable/equatable.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:meta/meta.dart';

@immutable
abstract class MapState extends Equatable {
  MapState([List props = const []]) : super();
}

class MapEmpty extends MapState {
  @override
  // TODO: implement props
  List<Object> get props => null;
}

class MapLoading extends MapState {
  @override
  // TODO: implement props
  List<Object> get props => null;
}

class MapLoaded extends MapState {
  MapLoaded({@required this.markers})
      : assert(markers != null),
        super([markers]);

  final Map<String, Marker> markers;

  @override
  // TODO: implement props
  List<Object> get props => null;
}

class MapError extends MapState {
  @override
  // TODO: implement props
  List<Object> get props => null;
}
