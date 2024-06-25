import 'dart:developer';
import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<User?> createUserWithEmailAndPassword(
      String email, String password, String userName) async {
    try {
      final UserCredential cred = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      await cred.user!
          .updateDisplayName(userName); // Pastikan userName telah divalidasi
      await cred.user!.reload();
      return _auth.currentUser;
    } catch (e) {
      log("Error in createUserWithEmailAndPassword: ${e.toString()}");
      // Handle error secara lebih spesifik sesuai kebutuhan aplikasi Anda
      // Contoh: throw FirebaseAuthException(message: e.toString(), code: 'create_user_failed');
    }
    return null;
  }

  Future<User?> loginUserWithEmailAndPassword(
      String email, String password) async {
    try {
      final UserCredential cred = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return cred.user;
    } catch (e) {
      log("Error in loginUserWithEmailAndPassword: ${e.toString()}");
      // Handle error secara lebih spesifik sesuai kebutuhan aplikasi Anda
      // Contoh: throw FirebaseAuthException(message: e.toString(), code: 'login_failed');
    }
    return null;
  }

  Future<void> signout() async {
    try {
      await _auth.signOut();
    } catch (e) {
      log("Error in signout: ${e.toString()}");
      // Handle error secara lebih spesifik sesuai kebutuhan aplikasi Anda
      // Contoh: throw FirebaseAuthException(message: e.toString(), code: 'signout_failed');
    }
  }

  // Metode untuk signupUserWithEmailAndPassword
  Future<User?> signupUserWithEmailAndPassword(
      String email, String password, String userName) async {
    try {
      final UserCredential cred = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      await cred.user!
          .updateDisplayName(userName); // Pastikan userName telah divalidasi
      await cred.user!.reload();
      return _auth.currentUser;
    } catch (e) {
      log("Error in signupUserWithEmailAndPassword: ${e.toString()}");
      // Handle error secara lebih spesifik sesuai kebutuhan aplikasi Anda
      // Contoh: throw FirebaseAuthException(message: e.toString(), code: 'signup_failed');
    }
    return null;
  }
}
