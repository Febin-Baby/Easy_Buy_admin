// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easybuy_admin_app/model/product_detail_display_arguments.dart';

import 'package:easybuy_admin_app/view/core/colors.dart';
import 'package:easybuy_admin_app/view/pages/product_view/product_view.dart';
import 'package:easybuy_admin_app/view/widgets/loading_animation_widget.dart';
import 'package:flutter/material.dart';
import 'package:easybuy_admin_app/view/pages/products_page/add_product_page.dart';
import 'package:easybuy_admin_app/view/widgets/item_card.dart';
import 'package:easybuy_admin_app/view/widgets/appbar_custom.dart';

class ProductScreen extends StatelessWidget {
  const ProductScreen({
    Key? key,
    required this.title,
  }) : super(key: key);

  final String title;
  static const routeFromhome = 'product';

  @override
  Widget build(BuildContext context) {
    CollectionReference productrefereence =
        FirebaseFirestore.instance.collection('product');
    return Scaffold(
      appBar: WidgetAppbar(
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios,
          ),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        title: title,
      ),
      body: StreamBuilder(
        stream: productrefereence.snapshots(),
        builder: (context, snapshot) {
          List<QueryDocumentSnapshot<Object?>> data = [];
          if (snapshot.data == null) {
            return const Center(
              child: Loading(),
            );
          }
          data = snapshot.data!.docs;
          if (snapshot.data!.docs.isEmpty || data.isEmpty) {
            return const Center(
              child: Text('Add atleast one product'),
            );
          }
          return GridView.builder(
            itemCount: data.length,
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: kwidth * .01,
              mainAxisSpacing: khieght * .02,
              mainAxisExtent: khieght * 0.30,
            ),
            itemBuilder: (context, index) {
              return InkWell(
                onTap: () {
                  Navigator.of(context).pushNamed(
                    ProductView.routename,arguments: ProductArgument(data: data[index])
                  );
                },
                child: ItemCard(
                  name: data[index]['name'],
                  imagepath: data[index]['imagelist'][0],
                  discount: data[index]['stringdiscount'],
                  productId: data[index].id,
                  price: data[index]['stringprice'],
                ),
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          Navigator.of(context).pushNamed(AddProductScreen.routename);
        },
      ),
    );
  }
}
