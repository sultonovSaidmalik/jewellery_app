import 'package:firebase_auth/firebase_auth.dart';
import 'package:jewellery_app/src/repository/auth_repository/auth_repository.dart';

class SignInRepository implements AuthRepository {
  SignInRepository._() : auth = FirebaseAuth.instance;

  static final _instance = SignInRepository._();

  factory SignInRepository() => _instance;


  @override
  final FirebaseAuth auth;

  @override
  Future<String?> signInWithEmail({required String email, required String password}) {
    throw UnimplementedError();
  }

  @override
  void signInWithGoogle() {

  }







  @override
  Future<String?> signUpWithEmail({required String email, required String password, required String phone, required String username}) {
    throw UnimplementedError();
  }

  @override
  void signUpWithGoogle() {}
}