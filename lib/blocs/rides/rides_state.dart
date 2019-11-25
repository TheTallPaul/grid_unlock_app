import 'package:equatable/equatable.dart';
import 'package:rides_repository/rides_repository.dart';

abstract class RidesState extends Equatable {
  const RidesState();

  @override
  List<Object> get props => [];
}

class RidesLoading extends RidesState {}

class RidesLoaded extends RidesState {
  const RidesLoaded([this.rides = const []]);

  final List<Ride> rides;

  @override
  List<Object> get props => [rides];

  @override
  String toString() => 'RidesLoaded { rides: $rides }';
}

class RidesNotLoaded extends RidesState {}
