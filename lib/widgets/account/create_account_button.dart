import 'package:flutter/material.dart';
import 'package:grid_unlock/screens/screens.dart';
import 'package:user_repository/user_repository.dart';

class CreateAccountButton extends StatelessWidget {
  const CreateAccountButton({@required UserRepository userRepository, Key key})
      : assert(userRepository != null),
        _userRepository = userRepository,
        super(key: key);

  final UserRepository _userRepository;

  @override
  Widget build(BuildContext context) {
    return FlatButton(
      onPressed: () {
        Navigator.of(context).push(
          MaterialPageRoute<void>(builder: (context) {
            return RegisterScreen(userRepository: _userRepository);
          }),
        );
      },
      child: const Text(
        'Create an Account',
      ),
    );
  }
}
