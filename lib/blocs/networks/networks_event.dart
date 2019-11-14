import 'package:equatable/equatable.dart';
import 'package:networks_repository/networks_repository.dart';

abstract class NetworksEvent extends Equatable {
  const NetworksEvent();

  @override
  List<Object> get props => [];
}

class LoadNetworks extends NetworksEvent {}

class AddNetwork extends NetworksEvent {
  const AddNetwork(this.network);

  final Network network;

  @override
  List<Object> get props => [network];

  @override
  String toString() => 'AddNetwork { network: $network }';
}

class UpdateNetwork extends NetworksEvent {
  const UpdateNetwork(this.updatedNetwork);

  final Network updatedNetwork;

  @override
  List<Object> get props => [updatedNetwork];

  @override
  String toString() => 'UpdateNetwork { updatedNetwork: $updatedNetwork }';
}

class DeleteNetwork extends NetworksEvent {
  const DeleteNetwork(this.network);

  final Network network;

  @override
  List<Object> get props => [network];

  @override
  String toString() => 'DeleteNetwork { network: $network }';
}

class NetworksUpdated extends NetworksEvent {
  const NetworksUpdated(this.networks);

  final List<Network> networks;

  @override
  List<Object> get props => [networks];
}
