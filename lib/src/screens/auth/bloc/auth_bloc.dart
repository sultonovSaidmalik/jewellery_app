import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jewellery_app/src/common/models/user_model.dart';
import 'package:jewellery_app/src/repository/auth_repository/sign_in/sign_in_repository.dart';
import 'package:jewellery_app/src/repository/auth_repository/sign_up/sign_up_repository.dart';

import '../../../repository/auth_repository/auth_repository.dart';

part 'auth_event.dart';

part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthRepository signIn;
  AuthRepository signUp;

  AuthBloc()
      : signIn = SignInRepository(),
        signUp = SignUpRepository(),
        super(const AuthState(status: AuthStatus.initial)) {
    on<AuthSignUpWithEmailEvent>(_signUpWithEmail);
  }

  void _signUpWithEmail(AuthSignUpWithEmailEvent event, Emitter emit) async {
    final result = await signUp.signUpWithEmail(
      email: event.email,
      password: event.password,
      phone: event.phone,
      username: event.name,
    );
    if (result == null) {
      emit(state.copyWith(status: AuthStatus.successAuth));
    }
  }
}
