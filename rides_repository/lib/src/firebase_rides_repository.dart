import 'package:cloud_firestore/cloud_firestore.dart';

import '../rides_repository.dart';
import 'entities/entities.dart';

class FirebaseRidesRepository implements RidesRepository {
  final rideCollection = Firestore.instance.collection('rides');

  @override
  Future<void> addNewRide(Ride ride) {
    return rideCollection.add(ride.toEntity().toDocument());
  }

  @override
  Stream<List<Ride>> rides() {
    return rideCollection.snapshots().map((snapshot) {
      return snapshot.documents
          .map((document) =>
              Ride.fromEntity(RideEntity.fromSnapshot(document)))
          .toList();
    });
  }

  @override
  Future<void> updateRide(Ride ride) {
    return rideCollection
        .document(ride.id)
        .updateData(ride.toEntity().toDocument());
  }
}
