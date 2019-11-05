import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grid_unlock/blocs/blocs.dart';
import 'package:grid_unlock/repositories/repositories.dart';
import 'package:grid_unlock/screens/screens.dart';
import 'package:grid_unlock/widgets/widgets.dart';

void main() {
  BlocSupervisor.delegate = SimpleBlocDelegate();

  final MapRepository mapRepository =
      MapRepository(googleMapsApiClient: GoogleMapsApiClient());
  final UserRepository userRepository = UserRepository();

  runApp(MultiBlocProvider(providers: [
    BlocProvider<SettingsBloc>(
      builder: (context) => SettingsBloc(),
    ),
    BlocProvider<MapBloc>(
      builder: (context) => MapBloc(mapRepository, SettingsBloc()),
    ),
    BlocProvider<PermissionsBloc>(
      builder: (context) => PermissionsBloc(),
    ),
    BlocProvider<AuthenticationBloc>(
      builder: (context) => AuthenticationBloc(userRepository: userRepository),
    ),
  ], child: App(mapRepository: mapRepository, userRepository: userRepository)));
}

class App extends StatelessWidget {
  App(
      {Key key,
      @required MapRepository mapRepository,
      @required UserRepository userRepository})
      : assert(mapRepository != null),
        assert(userRepository != null),
        super(key: key);

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
