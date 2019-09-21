import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

@immutable
abstract class PermissionsEvent extends Equatable {
  PermissionsEvent([List props = const []]) : super(props);
}

class RequestLocationPermission extends PermissionsEvent {}

class CheckPermissions extends PermissionsEvent {}
