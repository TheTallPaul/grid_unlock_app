import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grid_unlock/blocs/blocs.dart';
import 'package:grid_unlock/repositories/repositories.dart';
import 'package:grid_unlock/screens/screens.dart';
import 'package:grid_unlock/widgets/widgets.dart';
import 'package:networks_repository/networks_repository.dart';
import 'package:user_repository/user_repository.dart';

void main() {
  BlocSupervisor.delegate = SimpleBlocDelegate();
  runApp(App());
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final settingsBloc = SettingsBloc();

    return MultiBlocProvider(
        providers: [
          BlocProvider<SettingsBloc>(
            builder: (context) {
              return settingsBloc;
            },
          ),
          BlocProvider<MapBloc>(
            builder: (context) => MapBloc(settingsBloc),
          ),
          BlocProvider<PermissionsBloc>(
            builder: (context) {
              return PermissionsBloc();
            },
          ),
          BlocProvider<AuthenticationBloc>(
            builder: (context) {
              return AuthenticationBloc(userRepository: UserRepository())
                ..add(AppStarted());
            },
          ),
          BlocProvider<NetworksBloc>(builder: (context) {
            return NetworksBloc(
                networksRepository: FirebaseNetworksRepository())
              ..add(LoadNetworks());
          }),
        ],
        child: BlocBuilder<SettingsBloc, SettingsState>(
          builder: (context, state) {
            BlocProvider.of<PermissionsBloc>(context)
                .add(RequestLocationPermission());

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
        ));
  }
}
