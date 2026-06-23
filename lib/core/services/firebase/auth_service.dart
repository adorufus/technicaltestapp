import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthService extends GetxService {
  late FirebaseAuth _auth;
  late GoogleSignIn _googleSignIn;

  Future<AuthService> init() async {
    _auth = FirebaseAuth.instance;
    _googleSignIn = GoogleSignIn.instance;

    _googleSignIn.initialize(
      serverClientId:
          "175524284438-1q3vo0p4vioo5ncu6iqt7tgcqh96u773.apps.googleusercontent.com",
    );
    return this;
  }

  FirebaseAuth get authInstance => _auth;

  Future<void> signinWithGoogle() async {
    print("sign in with google");
    try {
      final GoogleSignInAccount googleUser = await _googleSignIn.authenticate();
      final GoogleSignInAuthentication googleAuth = googleUser.authentication;
      final creds = GoogleAuthProvider.credential(idToken: googleAuth.idToken);

      _auth.signInWithCredential(creds);

      print("sukses jaya jaya");
    } catch (e) {
      print("Google sign in failed $e");
    }
  }
}
