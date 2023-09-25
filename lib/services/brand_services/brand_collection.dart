import 'dart:io';
import 'package:easybuy_admin_app/model/brand_model.dart';
import 'package:easybuy_admin_app/model/firebase_instance.dart';
import 'package:easybuy_admin_app/view/widgets/loading_animation_widget.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';

class BrandServices {
  Future<void> addBrandToFirebase(
      {required BrandModel brandModel,required BuildContext context}) async {
    try {
      loading(context);
      TaskSnapshot snapshot = await FirebaseInstances.firebaseStorage
          .ref()
          .child('images/brands/${brandModel.name}')
          .putFile(
            File(brandModel.imagepath),
          );
      String imageUrl = await snapshot.ref.getDownloadURL();
      await FirebaseInstances.firestore
          .collection('brands')
          .doc()
          .set({'name': brandModel.name, 'image': imageUrl}).then(
        (value) {
          Navigator.of(context).pop();
          alertshower(message: 'success', context: context,isSuccess: true);
        },
      );
    } on FirebaseException catch (e) {
      Navigator.of(context).pop();
      alertshower(message: e.message??'Error', context: context);
    }
  }

  alertshower({required String message, required BuildContext context, bool isSuccess = false}) {
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Alert'),
        content: Text(message),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
              if (isSuccess) {
                Navigator.of(context).pop();
              }
            },
            child: const Text('OK'),
          ),
        ],
      ),
    );
  }
  loading(BuildContext context) {
    return showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => const Loading(),
    );
  }
}
