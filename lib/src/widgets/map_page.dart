import 'dart:async';

import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import 'package:grid_unlock/src/blocs/blocs.dart';

class MapPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final mapBloc = BlocProvider.of<MapBloc>(context);
    final Completer<GoogleMapController> _googleMapController = Completer();
    final initialCoordinates =
        const LatLng(45.518880, -122.679133); // Pioneer Courthouse Square
    final initialZoom = 16.0;

    void _onMapCreated(GoogleMapController controller) {
      if (!_googleMapController.isCompleted) {
        _googleMapController.complete(controller);
      }
    }

    mapBloc.dispatch(FetchOffices());

    return Scaffold(
        appBar: AppBar(title: Text('Map'), actions: <Widget>[
          IconButton(
            icon: Icon(Icons.home),
            onPressed: () {
              Navigator.pop(context);
            },
          )
        ]),
        body: BlocListener<MapBloc, MapState>(listener: (context, state) {
          if (state is MapEmpty) {
            mapBloc.dispatch(FetchOffices());
          }
        }, child: BlocBuilder<MapBloc, MapState>(builder: (context, state) {
          if (state is MapLoaded) {
            Map<String, Marker> markers = state.markers;

            return GoogleMap(
              initialCameraPosition:
                  CameraPosition(target: initialCoordinates, zoom: initialZoom),
              onMapCreated: _onMapCreated,
              myLocationEnabled: true,
              markers: Set<Marker>.of(markers.isNotEmpty ? markers.values : []),
            );
          } else {
            return Container();
          }
        })));
  }
}
