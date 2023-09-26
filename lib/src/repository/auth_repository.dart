import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

abstract interface class AuthRepository {
  abstract final FirebaseAuth auth;

  void googleAuth();
}

class AuthRepositoryImpl implements AuthRepository {
  @override
  final FirebaseAuth auth;

  const AuthRepositoryImpl({
    required this.auth,
  });

  @override
  void googleAuth() async{
    GoogleSignIn _googleSignIn = GoogleSignIn();

    await _googleSignIn.signIn();
  }
}
