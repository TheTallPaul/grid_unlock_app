import 'package:cloud_firestore/cloud_firestore.dart';

import '../networks_repository.dart';
import 'entities/entities.dart';

class FirebaseNetworksRepository implements NetworksRepository {
  final networkCollection = Firestore.instance.collection('networks');

  @override
  Future<void> addNewNetwork(Network network) {
    return networkCollection.add(network.toEntity().toDocument());
  }

  @override
  Future<void> deleteNetwork(Network network) {
    return networkCollection.document(network.id).delete();
  }

  @override
  Stream<List<Network>> networks() {
    return networkCollection.snapshots().map((snapshot) {
      return snapshot.documents
          .map((document) =>
              Network.fromEntity(NetworkEntity.fromSnapshot(document)))
          .toList();
    });
  }

  @override
  Future<void> updateNetwork(Network network) {
    return networkCollection
        .document(network.id)
        .updateData(network.toEntity().toDocument());
  }
}
