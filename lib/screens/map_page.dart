import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_google_places/flutter_google_places.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:google_maps_webservice/places.dart';
import 'package:grid_unlock/blocs/blocs.dart';
import 'package:grid_unlock/widgets/widgets.dart';

class MapPage extends StatelessWidget {
  static const routeName = '/map';

  @override
  Widget build(BuildContext context) {
    const initialCoordinates =
        LatLng(45.518880, -122.679133); // Pioneer Courthouse Square
    const initialZoom = 16.0;

    return Scaffold(
        appBar: AppBar(
          title: const Text('Rider'),
          actions: <Widget>[
            BlocBuilder<MapBloc, MapState>(builder: (context, state) {
              if (state is MapLoading) {
                return const LoadingIndicator();
              } else {
                return IconButton(
                    icon: Icon(Icons.search),
                    onPressed: () async {
                      final Prediction prediction = await PlacesAutocomplete.show(
                        context: context,
                        apiKey: Keys.kGoogleApiKey,
                        mode: Mode.overlay,
                        logo: Container(
                          height: 0,
                        ),
                      );
                      print(prediction.placeId + prediction.description);
                    });
              }
            })
          ],
        ),
        drawer: NavigationDrawer(),
        body: GoogleMap(
          initialCameraPosition:
              CameraPosition(target: initialCoordinates, zoom: initialZoom),
          onMapCreated: (GoogleMapController controller) {
            BlocProvider.of<MapBloc>(context).add(MapCreated(controller));
            BlocProvider.of<MapBloc>(context).add(UpdateMapTheme(
                BlocProvider.of<SettingsBloc>(context).state.darkMode));
          },
          myLocationEnabled: true,
          compassEnabled: true,
        ));
  }
}
