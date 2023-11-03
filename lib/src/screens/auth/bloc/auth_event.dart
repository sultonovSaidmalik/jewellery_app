part of 'auth_bloc.dart';

abstract class AuthEvent extends Equatable {
  const AuthEvent();
}

class AuthSignUpWithEmailEvent extends AuthEvent {
  final String name;
  final String email;
  final String password;
  final String phone;

  const AuthSignUpWithEmailEvent({
    required this.name,
    required this.email,
    required this.password,
    required this.phone,
  });

  @override
  List<Object?> get props => [name, email, password, phone];
}

class AuthSignUpWithGoogleEvent extends AuthEvent {
  final String name;
  final String phone;

  const AuthSignUpWithGoogleEvent({
    required this.name,
    required this.phone,
  });

  @override
  List<Object?> get props => [name, phone];
}
