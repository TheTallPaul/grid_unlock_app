import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import 'package:grid_unlock/src/repositories/repositories.dart';
import 'package:grid_unlock/src/models/models.dart';
import 'blocs.dart';

class MapBloc extends Bloc<MapEvent, MapState> {
  MapBloc({@required this.mapRepository}) : assert(mapRepository != null);

  final MapRepository mapRepository;

  @override
  MapState get initialState => MapEmpty();

  @override
  Stream<MapState> mapEventToState(MapEvent event) async* {
    if (event is FetchOffices) {
      yield MapLoading();
      try {
        final Map<String, Marker> markers = {};
        final Locations offices = await mapRepository.getOffices();

        for (final office in offices.offices) {
          final marker = Marker(
            markerId: MarkerId(office.name),
            position: LatLng(office.lat, office.lng),
            infoWindow: InfoWindow(title: office.name, snippet: office.address),
          );
          markers[office.name] = marker;
        }
        yield MapLoaded(markers: markers);
      } catch (_) {
        yield MapError();
      }
    }
  }
}
