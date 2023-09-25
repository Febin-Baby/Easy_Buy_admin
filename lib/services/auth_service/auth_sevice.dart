import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easybuy_admin_app/model/firebase_instance.dart';

class AuthService {
  Future<bool> adminSignIn({required String email, required String password}) async {
    try {
      return await FirebaseInstances.auth
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