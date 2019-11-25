import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:meta/meta.dart';

import '../entities/entities.dart';

@immutable
class Ride {
  const Ride(
      this.actual_dropoff_time,
      this.actual_pickup_time,
      this.driver_cancelled,
      this.dropoff_location,
      this.pickup_location,
      this.request_time,
      this.scheduled_dropoff_time,
      this.scheduled_pickup_time,
      {String driver_comments = '',
      bool driver_marked_completion = false,
      double driver_rating_of_rider = -1,
      bool rider_cancelled = false,
      String rider_comments = '',
      bool rider_marked_completion = false,
      double rider_rating_of_driver = -1,
      bool rider_reached_destination = false,
      String id})
      : this.driver_comments = driver_comments ?? '',
        this.driver_marked_completion = driver_marked_completion ?? false,
        this.driver_rating_of_rider = driver_rating_of_rider ?? -1,
        this.rider_cancelled = rider_cancelled ?? false,
        this.rider_comments = rider_comments ?? '',
        this.rider_marked_completion = rider_marked_completion ?? false,
        this.rider_rating_of_driver = rider_rating_of_driver ?? -1,
        this.rider_reached_destination = rider_reached_destination ?? false,
        this.id = id ?? id;

  final Timestamp actual_dropoff_time;
  final Timestamp actual_pickup_time;
  final bool driver_cancelled;
  final String driver_comments;
  final bool driver_marked_completion;
  final double driver_rating_of_rider;
  final GeoPoint dropoff_location;
  final GeoPoint pickup_location;
  final Timestamp request_time;
  final bool rider_cancelled;
  final String rider_comments;
  final bool rider_marked_completion;
  final double rider_rating_of_driver;
  final bool rider_reached_destination;
  final Timestamp scheduled_dropoff_time;
  final Timestamp scheduled_pickup_time;
  final String id;

  @override
  String toString() {
    return '''Ride {
      actual_dropoff_time: $actual_dropoff_time,
      actual_pickup_time: $actual_pickup_time,
      driver_cancelled: $driver_cancelled,
      driver_comments: $driver_comments,
      driver_marked_completion: $driver_marked_completion,
      dropoff_location: $dropoff_location,
      pickup_location: $pickup_location,
      request_time: $request_time,
      rider_cancelled: $rider_cancelled,
      rider_comments: $rider_comments,
      rider_marked_completion: $rider_marked_completion,
      rider_rating_of_driver: $rider_rating_of_driver,
      rider_reached_destination: $rider_reached_destination,
      scheduled_dropoff_time: $scheduled_dropoff_time,
      scheduled_pickup_time: $scheduled_pickup_time,
      id: $id,
    }''';
  }

  RideEntity toEntity() {
    return RideEntity(
        actual_dropoff_time,
        actual_pickup_time,
        driver_cancelled,
        driver_comments,
        driver_marked_completion,
        driver_rating_of_rider,
        dropoff_location,
        pickup_location,
        request_time,
        rider_cancelled,
        rider_comments,
        rider_marked_completion,
        rider_rating_of_driver,
        rider_reached_destination,
        scheduled_dropoff_time,
        scheduled_pickup_time,
        id);
  }

  static Ride fromEntity(RideEntity entity) {
    return Ride(
        entity.actual_dropoff_time,
        entity.actual_pickup_time,
        entity.driver_cancelled,
        entity.dropoff_location,
        entity.pickup_location,
        entity.request_time,
        entity.scheduled_dropoff_time,
        entity.scheduled_pickup_time,
        driver_comments: entity.driver_comments,
        driver_marked_completion: entity.driver_marked_completion,
        driver_rating_of_rider: entity.driver_rating_of_rider,
        rider_cancelled: entity.rider_cancelled,
        rider_comments: entity.rider_comments,
        rider_marked_completion: entity.rider_marked_completion,
        rider_rating_of_driver: entity.rider_rating_of_driver,
        rider_reached_destination: entity.rider_reached_destination,
        id: entity.id);
  }
}
