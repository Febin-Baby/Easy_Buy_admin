import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';

class FirebaseInstances {
  //Firebase Auth
  static final FirebaseAuth auth = FirebaseAuth.instance;

  // Firebase firestore instance
  static final FirebaseFirestore firestore = FirebaseFirestore.instance;

  // firebase storage instance
  static final FirebaseStorage firebaseStorage = FirebaseStorage.instance;
}
