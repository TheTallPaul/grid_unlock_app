import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

@immutable
abstract class MapEvent extends Equatable {
  MapEvent([List props = const []]) : super();
}

class FetchUserLocation extends MapEvent {
  @override
  // TODO: implement props
  List<Object> get props => null;
}

class FetchOffices extends MapEvent {
  @override
  // TODO: implement props
  List<Object> get props => null;
}
