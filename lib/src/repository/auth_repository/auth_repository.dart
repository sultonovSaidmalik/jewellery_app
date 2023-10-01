import 'package:firebase_auth/firebase_auth.dart';
abstract interface class AuthRepository {
  abstract final FirebaseAuth auth;

  void signUpWithGoogle() {}
  void signInWithGoogle() {}

  Future<String?> signUpWithEmail({
    required String email,
    required String password,
    required String phone,
    required String username,
  });

  Future<String?> signInWithEmail({
    required String email,
    required String password,
  });
}
