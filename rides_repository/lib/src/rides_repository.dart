import 'dart:async';

import '../rides_repository.dart';

abstract class RidesRepository {
  Future<void> addNewRide(Ride ride);

  Stream<List<Ride>> rides();

  Future<void> updateRide(Ride ride);
}
