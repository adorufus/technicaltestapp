import 'package:technicaltest/core/services/firebase/auth_service.dart';

class AuthRepository {
  final AuthService authService;

  AuthRepository({required this.authService});

  Future signIn() async {
    await authService.signinWithGoogle();
    
  }
}