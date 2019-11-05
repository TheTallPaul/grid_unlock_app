import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

abstract class LoginEvent extends Equatable {
  const LoginEvent();

  @override
  List<Object> get props => [];
}

class LoginEmailChanged extends LoginEvent {
  const LoginEmailChanged({@required this.email});

  final String email;

  @override
  List<Object> get props => [email];

  @override
  String toString() => 'EmailChanged { email :$email }';
}

class LoginPasswordChanged extends LoginEvent {
  const LoginPasswordChanged({@required this.password});

  final String password;

  @override
  List<Object> get props => [password];

  @override
  String toString() => 'PasswordChanged { password: $password }';
}

class LoginSubmitted extends LoginEvent {
  const LoginSubmitted({
    @required this.email,
    @required this.password,
  });

  final String email;
  final String password;

  @override
  List<Object> get props => [email, password];

  @override
  String toString() {
    return 'Submitted { email: $email, password: $password }';
  }
}

class LoginWithGooglePressed extends LoginEvent {}

class LoginWithCredentialsPressed extends LoginEvent {
  const LoginWithCredentialsPressed({
    @required this.email,
    @required this.password,
  });

  final String email;
  final String password;

  @override
  List<Object> get props => [email, password];

  @override
  String toString() {
    return 'LoginWithCredentialsPressed { email: $email, password: $password }';
  }
}
