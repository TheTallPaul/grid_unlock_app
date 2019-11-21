import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:meta/meta.dart';

import '../entities/entities.dart';

@immutable
class Network {
  Network(this.date_created, this.location, this.name, this.paid, this.public,
      {String description = '', String id})
      : this.description = description ?? '',
        this.id = id;

  final Timestamp date_created;
  final String description;
  final String id;
  final GeoPoint location;
  final String name;
  final bool paid;
  final bool public;

  @override
  String toString() {
    return '''Network {
      date_created: $date_created,
      description: $description,
      id: $id,
      location: $location,
      name: $name,
      paid: $paid,
      public: $public 
    }''';
  }

  NetworkEntity toEntity() {
    return NetworkEntity(
        date_created, description, id, location, name, paid, public);
  }

  static Network fromEntity(NetworkEntity entity) {
    return Network(entity.date_created, entity.location, entity.name,
        entity.paid, entity.public,
        description: entity.description, id: entity.id);
  }
}
