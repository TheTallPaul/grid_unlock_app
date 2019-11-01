import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_webservice/places.dart';

@immutable
abstract class MapEvent extends Equatable {
  const MapEvent();
}

class FetchUserLocation extends MapEvent {
  @override
  List<Object> get props => [];
}

class FetchOffices extends MapEvent {
  @override
  List<Object> get props => [];
}

class RefreshRiderDestination extends MapEvent {
  const RefreshRiderDestination({@required this.riderDestination})
      : assert(riderDestination != null);

  final Prediction riderDestination;

  @override
  List<Object> get props => [riderDestination];
}

class FetchRiderDestination extends MapEvent {
  @override
  List<Object> get props => [];
}
