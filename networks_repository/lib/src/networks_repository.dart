import 'dart:async';

import '../networks_repository.dart';

abstract class NetworksRepository {
  Future<void> addNewNetwork(Network network);

  Future<void> deleteNetwork(Network network);

  Stream<List<Network>> networks();

  Future<void> updateNetwork(Network network);
}
