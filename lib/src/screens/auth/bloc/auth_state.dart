part of 'auth_bloc.dart';

enum AuthStatus { initial, successAuth, errorAuth, notFoundUser }

class AuthState extends Equatable {
  final AuthStatus status;
  final User? user;

  const AuthState({
    this.user,
    required this.status,
  });

  @override
  List<Object?> get props => [status, user];

  AuthState copyWith({
    AuthStatus? status,
    User? user,
  }) {
    return AuthState(
      status: status ?? this.status,
      user: user ?? this.user,
    );
  }
}
