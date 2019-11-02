import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grid_unlock/blocs/blocs.dart';
import 'package:grid_unlock/repositories/repositories.dart';
import 'package:grid_unlock/repositories/style.dart';
import 'package:grid_unlock/screens/screens.dart';
import 'package:grid_unlock/widgets/widgets.dart';

void main() {
  BlocSupervisor.delegate = SimpleBlocDelegate();

  final MapRepository mapRepository =
      MapRepository(googleMapsApiClient: GoogleMapsApiClient());

  runApp(MultiBlocProvider(providers: [
    BlocProvider<SettingsBloc>(
      builder: (context) => SettingsBloc(),
    ),
    BlocProvider<MapBloc>(
      builder: (context) => MapBloc(mapRepository, SettingsBloc()),
    ),
    BlocProvider<PermissionsBloc>(
      builder: (context) => PermissionsBloc(),
    )
  ], child: App(mapRepository: mapRepository)));
}

class App extends StatelessWidget {
  App({Key key, @required this.mapRepository})
      : assert(mapRepository != null),
        super(key: key);

  final MapRepository mapRepository;

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<PermissionsBloc>(context).add(RequestLocationPermission());

    return BlocProvider<SettingsBloc>(
      builder: (context) => SettingsBloc(),
      child: BlocBuilder<SettingsBloc, SettingsState>(
        builder: (context, state) {
          return MaterialApp(
            title: 'Grid Unlock',
            home: MapPage(),
            theme: state.theme,
            // For when Dark Theme is enabled in the system drawer
            darkTheme: nightTheme(),
            onGenerateRoute: Router.generateRoute,
            initialRoute: Router.mapRoute,
          );
        },
      ),
    );
  }
}
