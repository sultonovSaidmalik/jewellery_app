import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

abstract interface class AuthRepository {
  abstract final FirebaseAuth auth;

  void googleAuth();
}

class AuthRepositoryImpl implements AuthRepository {
  AuthRepositoryImpl._() : auth = FirebaseAuth.instance;

  static final _instance = AuthRepositoryImpl._();

  factory AuthRepositoryImpl() => _instance;

  final GoogleSignIn _googleSignIn = GoogleSignIn();

  @override
  final FirebaseAuth auth;

  void emailPasswordRegister(String email, String password) async {
    print(email);
    print(password);
    try {

      UserCredential credential = await FirebaseAuth.instance.signInWithEmailAndPassword(email: email, password: password);
      await credential.user!.getIdToken();
      print((credential.credential).toString());
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');
      }
    }
  }

  @override
  void googleAuth() async {
    GoogleSignInAccount? account = await _googleSignIn.signIn();

    if (account != null) {
      GoogleSignInAuthentication googleSignInAuthentication =
          await account.authentication;

      //   AuthCredential credential = GoogleAuthProvider.credential(
      //     accessToken: googleSignInAuthentication.accessToken,
      //     idToken: googleSignInAuthentication.idToken,
      //   );
      // print(credential);
    }

    // UserCredential authResult = await auth.signInWithCredential(credential);
    // print(authResult);
  }
}
