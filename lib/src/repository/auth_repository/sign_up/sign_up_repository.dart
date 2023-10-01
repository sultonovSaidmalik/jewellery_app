
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:jewellery_app/src/common/models/user_model.dart' as userModel;

import '../../user_repository/user_repository.dart';
import '../auth_repository.dart';

class SignUpRepository implements AuthRepository {
  SignUpRepository._() : auth = FirebaseAuth.instance;

  static final _instance = SignUpRepository._();

  factory SignUpRepository() => _instance;


  @override
  final FirebaseAuth auth;

  Future<UserCredential?> emailPasswordRegister(
      String email, String password) async {
    try {
      UserCredential credential = await auth.createUserWithEmailAndPassword(
          email: email, password: password);
      if (credential.user != null) {
        // credential.user!.sendEmailVerification();
        print((credential.user).toString());
        return credential;
      }
      return null;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');
      }
      return null;
    }
  }

  Future<UserCredential?> googleAuth() async {
    UserCredential? user;
    if (kIsWeb) {
      user = await signUpWithGoogleInWeb();
    } else {
      user = await signUpWithGoogleInMobile();
    }
    return user;
  }

  Future<UserCredential> signUpWithGoogleInMobile() async {
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    final GoogleSignInAuthentication? googleAuth =
    await googleUser?.authentication;

    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    return await FirebaseAuth.instance.signInWithCredential(credential);
  }

  Future<UserCredential> signUpWithGoogleInWeb() async {
    GoogleAuthProvider googleProvider = GoogleAuthProvider();

    googleProvider
        .addScope('https://www.googleapis.com/auth/contacts.readonly');
    googleProvider.setCustomParameters({'login_hint': 'user@example.com'});

    return await auth.signInWithPopup(googleProvider);
  }

  @override
  void signUpWithGoogle() async {
    final user = await googleAuth();
  }

  @override
  Future<String?> signUpWithEmail({
    required String email,
    required String password,
    required String phone,
    required String username,
  }) async {
    final credentialUser = await emailPasswordRegister(email, password);
    if (credentialUser != null && credentialUser.user != null) {
      await credentialUser.user!.updateDisplayName(username);
      final user = userModel.User(
        userId: credentialUser.user!.uid,
        userName: username,
        userPhone: phone,
        userEmail: email,
        password: password,
        updatedAt: DateTime.now(),
        createdAt: DateTime.now(),
        orderHistories: [],
        favouriteProduct: [],
      );
      await UserRepositoryImpl().registerUser(user);
      return null;
    }
    return "User Error";
  }

  @override
  Future<String?> signInWithEmail({required String email, required String password}) {
    throw UnimplementedError();
  }

  @override
  void signInWithGoogle() {
  }
}
