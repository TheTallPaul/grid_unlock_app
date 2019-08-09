import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

@immutable
abstract class MapEvent extends Equatable {
  MapEvent([List props = const []]) : super(props);
}

class FetchOffices extends MapEvent {}
