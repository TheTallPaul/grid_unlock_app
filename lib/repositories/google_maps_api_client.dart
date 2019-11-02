import 'dart:convert';
import 'dart:io';

import 'package:grid_unlock/models/models.dart';
import 'package:http/http.dart' as http;

class GoogleMapsApiClient {
  static const googleLocationsURL =
      'https://about.google/static/data/locations.json';

  Future<Locations> getGoogleOffices() async {
    // Retrieve the locations of Google offices
    final response = await http.get(googleLocationsURL);
    if (response.statusCode == 200) {
      return Locations.fromJson(json.decode(response.body));
    } else {
      throw HttpException(
          'Unexpected status code ${response.statusCode}:'
          ' ${response.reasonPhrase}',
          uri: Uri.parse(googleLocationsURL));
    }
  }
}
