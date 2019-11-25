import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grid_unlock/blocs/blocs.dart';
import 'package:grid_unlock/screens/account/account.dart';
import 'package:grid_unlock/screens/screens.dart';
import 'package:user_repository/user_repository.dart';

class AccountPage extends StatelessWidget {
  const AccountPage({@required UserRepository userRepository})
      : assert(userRepository != null),
        _userRepository = userRepository;

  static const routeName = '/account';
  final UserRepository _userRepository;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthenticationBloc, AuthenticationState>(
        builder: (context, state) {
      if (state is Unauthenticated) {
        return LoginScreen(userRepository: _userRepository);
      }
      if (state is Authenticated) {
        return AccountHome(name: state.displayName);
      }
      return SplashScreen();
    });
  }
}
