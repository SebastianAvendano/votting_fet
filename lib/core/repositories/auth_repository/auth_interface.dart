import 'package:firebase_auth/firebase_auth.dart';

abstract class AuthInterface {
  Future<UserCredential?> login(String email, String password);
  Future<UserCredential?> sigInGoogle();
  resertPassword(String email);
  User? getCurrentUser();
  Future<void> signOut();
}
