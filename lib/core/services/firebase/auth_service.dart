import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthService extends GetxService {
  late FirebaseAuth _auth;
  late GoogleSignIn _googleSignIn;

  Future<AuthService> init() async {
    _auth = FirebaseAuth.instance;
    _googleSignIn = GoogleSignIn.instance;
    return this;
  }

  Future<void> signinWithGoogle() async {
    final GoogleSignInAccount googleUser = await _googleSignIn.authenticate();
    final GoogleSignInAuthentication googleAuth = googleUser.authentication;
    final creds = GoogleAuthProvider.credential(idToken: googleAuth.idToken);

    _auth.signInWithCredential(creds);
  }

  User get userInfo => _auth.currentUser!;
}