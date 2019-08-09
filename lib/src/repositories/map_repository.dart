import 'dart:async';

import 'package:grid_unlock/src/models/models.dart';
import 'package:meta/meta.dart';

import 'google_maps_api_client.dart';

class MapRepository {
  MapRepository({@required this.googleMapsApiClient})
      : assert(googleMapsApiClient != null);

  final GoogleMapsApiClient googleMapsApiClient;

  Future<Locations> getOffices() async {
    return await googleMapsApiClient.getGoogleOffices();
  }
}
