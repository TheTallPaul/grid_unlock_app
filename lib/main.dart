import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:grid_unlock/src/blocs/blocs.dart';
import 'package:grid_unlock/src/repositories/repositories.dart';
import 'package:grid_unlock/src/widgets/utilities/router.dart';
import 'package:grid_unlock/src/widgets/widgets.dart';

class SimpleBlocDelegate extends BlocDelegate {
  @override
  void onEvent(Bloc bloc, Object event) {
    super.onEvent(bloc, event);
    print(event);
  }

  @override
  onTransition(Bloc bloc, Transition transition) {
    super.onTransition(bloc, transition);
    print(transition);
  }

  @override
  void onError(Bloc bloc, Object error, StackTrace stacktrace) {
    super.onError(bloc, error, stacktrace);
    print(error);
  }
}

void main() {
  BlocSupervisor.delegate = SimpleBlocDelegate();

  final MapRepository mapRepository =
      MapRepository(googleMapsApiClient: GoogleMapsApiClient());

  runApp(MultiBlocProvider(providers: [
    BlocProvider<ThemeBloc>(
      builder: (context) => ThemeBloc(),
    ),
    BlocProvider<MapBloc>(
      builder: (context) => MapBloc(mapRepository: mapRepository),
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
    final permissionsBloc = BlocProvider.of<PermissionsBloc>(context);

    permissionsBloc.dispatch(RequestLocationPermission());

    return BlocProvider<ThemeBloc>(
      builder: (context) => ThemeBloc(),
      child: BlocBuilder<ThemeBloc, ThemeData>(
        builder: (context, theme) {
          return MaterialApp(
            title: 'Grid Unlock',
            home: MapPage(),
            theme: theme,
            onGenerateRoute: Router.generateRoute,
            initialRoute: Router.mapRoute,
          );
        },
      ),
    );
  }
}
