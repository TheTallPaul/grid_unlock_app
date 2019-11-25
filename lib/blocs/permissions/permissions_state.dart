import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

@immutable
abstract class PermissionsState extends Equatable {
  const PermissionsState();

  @override
  List<Object> get props => [];
}

class PermissionsEmpty extends PermissionsState {
  @override
  // TODO: implement props
  List<Object> get props => null;
}

class PermissionsRequesting extends PermissionsState {
  @override
  // TODO: implement props
  List<Object> get props => null;
}

class PermissionsRequested extends PermissionsState {
  const PermissionsRequested({@required this.locationWhenInUse});

  final Future<bool> locationWhenInUse;

  @override
  List<Object> get props => [locationWhenInUse];
}

class PermissionsError extends PermissionsState {
  @override
  // TODO: implement props
  List<Object> get props => null;
}
