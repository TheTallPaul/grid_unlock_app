import 'package:equatable/equatable.dart';
import 'package:networks_repository/networks_repository.dart';

abstract class NetworksState extends Equatable {
  const NetworksState();

  @override
  List<Object> get props => [];
}

class NetworksLoading extends NetworksState {}

class NetworksLoaded extends NetworksState {
  const NetworksLoaded([this.networks = const []]);

  final List<Network> networks;

  @override
  List<Object> get props => [networks];

  @override
  String toString() => 'NetworksLoaded { networks: $networks }';
}

class NetworksNotLoaded extends NetworksState {}
