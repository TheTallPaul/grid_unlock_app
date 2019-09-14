import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

@immutable
abstract class MapEvent extends Equatable {
  MapEvent([List props = const []]) : super(props);
}

class FetchUserLocation extends MapEvent {}

class FetchOffices extends MapEvent {}
