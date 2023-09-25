import 'package:easybuy_admin_app/model/add_product_model/add_product_model.dart';
import 'package:easybuy_admin_app/services/product_services/product_related.dart';
import 'package:flutter/material.dart';

class AddProductController extends ChangeNotifier {
  addProduct(ProductModel productDetails, BuildContext context) async {
    ProductServices.addProductToFirebase(
      productDetails: productDetails,
      context: context,
    );
    // print('Add product entering');
  }
}
