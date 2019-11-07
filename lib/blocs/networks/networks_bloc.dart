import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:grid_unlock/blocs/blocs.dart';
import 'package:meta/meta.dart';
import 'package:networks_repository/networks_repository.dart';

class NetworksBloc extends Bloc<NetworksEvent, NetworksState> {
  NetworksBloc({@required NetworksRepository networksRepository})
      : assert(networksRepository != null),
        _networksRepository = networksRepository;

  final NetworksRepository _networksRepository;
  StreamSubscription _networksSubscription;

  @override
  NetworksState get initialState => NetworksLoading();

  @override
  Stream<NetworksState> mapEventToState(NetworksEvent event) async* {
    if (event is LoadNetworks) {
      yield* _mapLoadNetworksToState();
    } else if (event is AddNetwork) {
      yield* _mapAddNetworkToState(event);
    } else if (event is UpdateNetwork) {
      yield* _mapUpdateNetworkToState(event);
    } else if (event is DeleteNetwork) {
      yield* _mapDeleteNetworkToState(event);
    } else if (event is NetworksUpdated) {
      yield* _mapNetworksUpdateToState(event);
    }
  }

  Stream<NetworksState> _mapLoadNetworksToState() async* {
    await _networksSubscription?.cancel();
    _networksSubscription = _networksRepository.networks().listen(
          (networks) => add(NetworksUpdated(networks)),
        );
  }

  Stream<NetworksState> _mapAddNetworkToState(AddNetwork event) async* {
    await _networksRepository.addNewNetwork(event.network);
  }

  Stream<NetworksState> _mapUpdateNetworkToState(UpdateNetwork event) async* {
    await _networksRepository.updateNetwork(event.updatedNetwork);
  }

  Stream<NetworksState> _mapDeleteNetworkToState(DeleteNetwork event) async* {
    await _networksRepository.deleteNetwork(event.network);
  }

  Stream<NetworksState> _mapNetworksUpdateToState(
      NetworksUpdated event) async* {
    yield NetworksLoaded(event.networks);
  }

  @override
  void close() {
    _networksSubscription?.cancel();
    super.close();
  }
}
