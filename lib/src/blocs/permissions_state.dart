import 'package:flutter/material.dart';

import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

@immutable
abstract class PermissionsState extends Equatable {
  PermissionsState([List props = const []]) : super();
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
  PermissionsRequested({@required this.locationWhenInUse})
      : assert(locationWhenInUse != null),
        super([locationWhenInUse]);

  final Future<bool> locationWhenInUse;

  @override
  // TODO: implement props
  List<Object> get props => null;
}

class PermissionsError extends PermissionsState {
  @override
  // TODO: implement props
  List<Object> get props => null;
}
