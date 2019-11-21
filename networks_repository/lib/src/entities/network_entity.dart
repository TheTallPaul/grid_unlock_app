import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';

class NetworkEntity extends Equatable {
  const NetworkEntity(this.date_created, this.description, this.id,
      this.location, this.name, this.paid, this.public);

  final Timestamp date_created;
  final String description;
  final String id;
  final GeoPoint location;
  final String name;
  final bool paid;
  final bool public;

  @override
  List<Object> get props =>
      [date_created, description, id, location, name, paid, public];

  @override
  String toString() {
    return '''NetworkEntity { 
      date_created: $date_created,
      description: $description,
      id: $id,
      location: $location,
      name: $name,
      paid: $paid,
      public: $public 
    }''';
  }

  static NetworkEntity fromJson(Map<String, Object> json) {
    return NetworkEntity(
      json['date_created'] as Timestamp,
      json['description'] as String,
      json['id'] as String,
      json['location'] as GeoPoint,
      json['name'] as String,
      json['paid'] as bool,
      json['public'] as bool,
    );
  }

  static NetworkEntity fromSnapshot(DocumentSnapshot snapshot) {
    return NetworkEntity(
      snapshot.data['date_created'],
      snapshot.data['description'],
      snapshot.documentID,
      snapshot.data['location'],
      snapshot.data['name'],
      snapshot.data['paid'],
      snapshot.data['public'],
    );
  }

  Map<String, Object> toJson() {
    return {
      "date_created": date_created,
      "description": description,
      "id": id,
      "location": location,
      "name": name,
      "paid": paid,
      "public": public,
    };
  }

  Map<String, Object> toDocument() {
    return {
      "date_created": date_created,
      "description": description,
      "location": location,
      "name": name,
      "paid": paid,
      "public": public,
    };
  }
}
