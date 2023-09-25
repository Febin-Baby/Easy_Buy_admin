import 'package:easybuy_admin_app/model/product_detail_display_arguments.dart';
import 'package:easybuy_admin_app/view/core/colors.dart';
import 'package:easybuy_admin_app/view/pages/product_view/widgets/product_imgview.dart';
import 'package:easybuy_admin_app/view/pages/product_view/widgets/product_name_to_discription_part.dart';
import 'package:easybuy_admin_app/view/pages/product_view/widgets/product_varients_to_last.dart';
import 'package:easybuy_admin_app/view/widgets/appbar_custom.dart';
import 'package:flutter/material.dart';

class ProductView extends StatelessWidget {
  const ProductView({super.key, required this.productDataO});
  final ProductArgument productDataO;

  static const String routename = '/Productview';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const WidgetAppbar(title: 'PRODUCT'),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ProductPageview(imagelist: productDataO.data['imagelist']),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: kwidth * 0.08),
              child: ProductNameToDiscription(
                name: productDataO.data['name'],
                discount: productDataO.data['stringdiscount'],
                discription: productDataO.data['description'],
                price: productDataO.data['stringprice'],
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: kwidth * 0.08),
              child: ProductVarientsToLast(varients: productDataO.data['varients']),
            ),
          ],
        ),
      ),
    );
  }
}
