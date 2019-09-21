import 'package:flutter/material.dart';

import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

@immutable
abstract class PermissionsState extends Equatable {
  PermissionsState([List props = const []]) : super(props);
}

class PermissionsEmpty extends PermissionsState {}

class PermissionsRequesting extends PermissionsState {}

class PermissionsRequested extends PermissionsState {
  PermissionsRequested({@required this.locationWhenInUse})
      : assert(locationWhenInUse != null),
        super([locationWhenInUse]);

  final Future<bool> locationWhenInUse;
}

class PermissionsError extends PermissionsState {}
