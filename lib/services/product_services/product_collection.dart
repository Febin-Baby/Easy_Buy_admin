import 'dart:io';
import 'package:easybuy_admin_app/model/add_product_model.dart';
import 'package:easybuy_admin_app/model/firebase_instance.dart';
import 'package:easybuy_admin_app/view/widgets/loading_animation_widget.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';

class ProductServices {
  Future<void> addProductToFirebase({
    required ProductModel productModel,
    required BuildContext context,
  }) async {
    try {
      loading(context);
      List<String> imageUrls = [];
      for (int i = 0; i < productModel.imagelist.length; i++) {
        TaskSnapshot snapshot = await FirebaseInstances.firebaseStorage
            .ref()
            .child('images/product/${productModel.imagelist[i]}$i')   
            .putFile(File(productModel.imagelist[i]));
        String doumloadUrl = await snapshot.ref.getDownloadURL();
        imageUrls.add(doumloadUrl);
      }

      await FirebaseInstances.firestore.collection('product').doc().set({
        'name': productModel.name,
        'stringdiscount': productModel.stringdiscount,
        'stringprice': productModel.stringprice,
        'imagelist': imageUrls,
        'brand': productModel.brand,
        'description': productModel.discription,
        'varients': productModel.varients,
      }).then((value) {
        Navigator.of(context).pop();
        _alertshower(message: 'Success', context: context,isSuccess: true);
      });
    } on FirebaseException catch (e) {
      _alertshower(message: e.message.toString(), context: context);
    }
  }

  loading(BuildContext context) {
    return showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => const Loading(),
    );
  }

  _alertshower({
    required String message,
    required BuildContext context,
    bool isSuccess = false,
  }) {
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
}
