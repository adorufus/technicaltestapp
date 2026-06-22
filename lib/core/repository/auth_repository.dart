import 'package:firebase_auth/firebase_auth.dart';
import 'package:technicaltest/core/services/firebase/auth_service.dart';

class AuthRepository {
  final AuthService authService;

  AuthRepository({required this.authService});

  Future signIn() async {
    await authService.signinWithGoogle();
  }

  User getUserInfo() {
    return authService.userInfo;
  }
}