import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:logger/logger.dart';
import 'package:injectable/injectable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:votting/core/repositories/auth_repository/auth_interface.dart';

@injectable
class AuthInterfaceImpl implements AuthInterface {
  final Logger _logger;
  final FirebaseAuth _firebaseAuth;
  final GoogleSignIn _googleSignIn;
  final FirebaseMessaging _firebaseMessaging;

  AuthInterfaceImpl(
    this._firebaseAuth,
    this._logger,
    this._googleSignIn,
    this._firebaseMessaging,
  );

  @override
  Future<UserCredential?> login(String email, String password) async {
    try {
      return await _firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
    } on FirebaseAuthException catch (e) {
      _logger.e(e.message);
      return null;
    }
  }

  @override
  Future<UserCredential?> sigInGoogle() async {
    try {
      await signOut();
      final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
      final GoogleSignInAuthentication? googleAuth =
          await googleUser?.authentication;
      final String? fcmToken = await _firebaseMessaging.getToken();
      final credential = GoogleAuthProvider.credential(
        accessToken: fcmToken ?? googleAuth?.accessToken,
        idToken: googleAuth?.idToken,
      );
      final userCredentials =
          await _firebaseAuth.signInWithCredential(credential);
      return userCredentials;
    } catch (e) {
      _logger.log(Level.error, "Mensaje de Error: $e");
      return null;
    }
  }

  @override
  Future<void> resertPassword(String email) async {
    try {
      return await _firebaseAuth.sendPasswordResetEmail(
        email: email,
      );
    } on FirebaseAuthException catch (e) {
      _logger.e(e.message);
      return;
    }
  }

  @override
  Future<void> signOut() async {
    await _firebaseAuth.signOut();
  }

  @override
  User? getCurrentUser() {
    return _firebaseAuth.currentUser;
  }
}
