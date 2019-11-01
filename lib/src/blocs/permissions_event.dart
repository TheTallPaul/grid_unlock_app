import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

@immutable
abstract class PermissionsEvent extends Equatable {}

class RequestLocationPermission extends PermissionsEvent {
  @override
  List<Object> get props => [];
}

class CheckPermissions extends PermissionsEvent {
  @override
  List<Object> get props => [];
}
