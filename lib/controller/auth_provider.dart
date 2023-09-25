import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthProvider extends ChangeNotifier {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  User? get user => _auth.currentUser;

  // Sign in with email and password
  Future<void> signInWithEmailAndPassword(String email, String pass) async {
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: pass);
      notifyListeners();
    } catch (e) {
      throw e.toString();
    }
  }

  // Sign out
  Future<void> signOut() async {
    await _auth.signOut();
    notifyListeners();
  }
}
class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  Future<bool> adminSignIn({required String email, required String password}) async {
    try {
      return await _auth
          .signInWithEmailAndPassword(email: email, password: password)
          .then((value) async {
        return true;
      });
    } on FirebaseException catch (_) {
      return false;
    } catch (e) {
      return false;
    }
  }
}