import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';

class RideEntity extends Equatable {
  const RideEntity(
      this.actual_dropoff_time,
      this.actual_pickup_time,
      this.driver_cancelled,
      this.driver_comments,
      this.driver_marked_completion,
      this.driver_rating_of_rider,
      this.dropoff_location,
      this.pickup_location,
      this.request_time,
      this.rider_cancelled,
      this.rider_comments,
      this.rider_marked_completion,
      this.rider_rating_of_driver,
      this.rider_reached_destination,
      this.scheduled_dropoff_time,
      this.scheduled_pickup_time,
      this.id);

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
  List<Object> get props => [
        actual_dropoff_time,
        actual_pickup_time,
        driver_comments,
        driver_marked_completion,
        driver_rating_of_rider,
        dropoff_location,
        pickup_location,
        request_time,
        rider_cancelled,
        rider_marked_completion,
        rider_rating_of_driver,
        rider_reached_destination,
        scheduled_dropoff_time,
        scheduled_pickup_time,
        id,
      ];

  @override
  String toString() {
    return '''RideEntity { 
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

  static RideEntity fromJson(Map<String, Object> json) {
    return RideEntity(
      json['actual_dropoff_time'] as Timestamp,
      json['actual_pickup_time'] as Timestamp,
      json['driver_cancelled'] as bool,
      json['driver_comments'] as String,
      json['driver_marked_completion'] as bool,
      json['driver_rating_of_rider'] as double,
      json['dropoff_location'] as GeoPoint,
      json['pickup_location'] as GeoPoint,
      json['request_time'] as Timestamp,
      json['rider_cancelled'] as bool,
      json['rider_comments'] as String,
      json['rider_marked_completion'] as bool,
      json['rider_rating_of_driver'] as double,
      json['rider_reached_destination'] as bool,
      json['scheduled_dropoff_time'] as Timestamp,
      json['scheduled_pickup_time'] as Timestamp,
      json['id'] as String,
    );
  }

  static RideEntity fromSnapshot(DocumentSnapshot snapshot) {
    return RideEntity(
      snapshot.data['actual_dropoff_time'],
      snapshot.data['actual_pickup_time'],
      snapshot.data['driver_cancelled'],
      snapshot.data['driver_comments'],
      snapshot.data['driver_marked_completion'],
      snapshot.data['driver_rating_of_rider'],
      snapshot.data['dropoff_location'],
      snapshot.data['pickup_location'],
      snapshot.data['request_time'],
      snapshot.data['rider_cancelled'],
      snapshot.data['rider_comments'],
      snapshot.data['rider_marked_completion'],
      snapshot.data['rider_rating_of_driver'],
      snapshot.data['rider_reached_destination'],
      snapshot.data['scheduled_dropoff_time'],
      snapshot.data['scheduled_pickup_time'],
      snapshot.documentID,
    );
  }

  Map<String, Object> toJson() {
    return {
      "actual_dropoff_time": actual_dropoff_time,
      "actual_pickup_time": actual_pickup_time,
      "driver_cancelled": driver_cancelled,
      "driver_comments": driver_comments,
      "driver_marked_completion": driver_marked_completion,
      "driver_rating_of_rider": driver_rating_of_rider,
      "dropoff_location": dropoff_location,
      "pickup_location": pickup_location,
      "request_time": request_time,
      "rider_cancelled": rider_cancelled,
      "rider_comments": rider_comments,
      "rider_marked_completion": rider_marked_completion,
      "rider_rating_of_driver": rider_rating_of_driver,
      "rider_reached_destination": rider_reached_destination,
      "scheduled_dropoff_time": scheduled_dropoff_time,
      "scheduled_pickup_time": scheduled_pickup_time,
      "id": id,
    };
  }

  Map<String, Object> toDocument() {
    return {
      "actual_dropoff_time": actual_dropoff_time,
      "actual_pickup_time": actual_pickup_time,
      "driver_cancelled": driver_cancelled,
      "driver_comments": driver_comments,
      "driver_marked_completion": driver_marked_completion,
      "driver_rating_of_rider": driver_rating_of_rider,
      "dropoff_location": dropoff_location,
      "pickup_location": pickup_location,
      "request_time": request_time,
      "rider_cancelled": rider_cancelled,
      "rider_comments": rider_comments,
      "rider_marked_completion": rider_marked_completion,
      "rider_rating_of_driver": rider_rating_of_driver,
      "rider_reached_destination": rider_reached_destination,
      "scheduled_dropoff_time": scheduled_dropoff_time,
      "scheduled_pickup_time": scheduled_pickup_time,
    };
  }
}
