import 'package:equatable/equatable.dart';
import 'package:rides_repository/rides_repository.dart';

abstract class RidesEvent extends Equatable {
  const RidesEvent();

  @override
  List<Object> get props => [];
}

class LoadRides extends RidesEvent {}

class AddRide extends RidesEvent {
  const AddRide(this.ride);

  final Ride ride;

  @override
  List<Object> get props => [ride];

  @override
  String toString() => 'AddRide { ride: $ride }';
}

class UpdateRide extends RidesEvent {
  const UpdateRide(this.updatedRide);

  final Ride updatedRide;

  @override
  List<Object> get props => [updatedRide];

  @override
  String toString() => 'UpdateRide { updatedRide: $updatedRide }';
}

class RidesUpdated extends RidesEvent {
  const RidesUpdated(this.rides);

  final List<Ride> rides;

  @override
  List<Object> get props => [rides];
}
