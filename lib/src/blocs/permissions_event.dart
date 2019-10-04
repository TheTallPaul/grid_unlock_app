import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

@immutable
abstract class PermissionsEvent extends Equatable {
  PermissionsEvent([List props = const []]) : super();
}

class RequestLocationPermission extends PermissionsEvent {
  @override
  // TODO: implement props
  List<Object> get props => null;
}

class CheckPermissions extends PermissionsEvent {
  @override
  // TODO: implement props
  List<Object> get props => null;
}
