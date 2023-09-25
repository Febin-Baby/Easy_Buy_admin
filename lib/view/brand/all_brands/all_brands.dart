import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easybuy_admin_app/model/firebase_instance.dart';
import 'package:easybuy_admin_app/view/brand/add_brands/add_brand_page.dart';
import 'package:easybuy_admin_app/view/core/colors.dart';
import 'package:easybuy_admin_app/view/widgets/appbar_custom.dart';
import 'package:easybuy_admin_app/view/widgets/loading_animation_widget.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class AllBrands extends StatelessWidget {
  AllBrands({super.key});

  static String brandDocID = '';
  static const String routname = '/All brands';
  CollectionReference brands=FirebaseInstances.firestore.collection('brands');

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: const WidgetAppbar(title: 'All brands'),
        body: StreamBuilder(
          stream: brands.snapshots(),
          builder: (context, snapshot) {
            if (snapshot.data == null) {
              return const Loading();
            }
            if (snapshot.data!.docs.isEmpty) {
              return const Center(
                child: Text('No brands'),
              );
            }
            return GridView.builder(
            padding: EdgeInsets.all(kwidth * 0.03),
            itemCount: snapshot.data!.docs.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: kwidth * 0.03,
              crossAxisSpacing: kwidth * 0.03,
            ),
            itemBuilder: (context, index) {
              return Stack(
                children: [
                  InkWell(
                    onTap: () {
                      brandDocID=snapshot.data!.docs[index].id;
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        color: kgrey,
                        borderRadius: BorderRadius.circular(kwidth * 0.04),
                      ),
                      width: double.maxFinite,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          SizedBox(
                            width: kwidth * 0.3,
                            height: khieght * 0.13,
                            child: Image.network(
                              snapshot.data!.docs[index]['image'],
                              fit: BoxFit.contain,
                            ),
                          ),
                          Text(snapshot.data!.docs[index]['name'])
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                    top: 8,
                    right: 4,
                    child: InkWell(
                      onTap: () {
                        _showAlertDialog(context);
                      },
                      child: const Icon(Icons.delete),
                    ),
                  ),
                ],
              );
            },
          );
          },
        ),
        floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.add),
          onPressed: () {
            Navigator.of(context).pushNamed(AddBrandPage.routname);
          },
        ),
      ),
    );
  }

  void _showAlertDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Delete'),
          content: const Text('Are you sure to deletet item'),
          actions: [
            TextButton(
              onPressed: () {
                // Close the dialog.
                Navigator.of(context).pop();
              },
              child: const Text('No'),
            ),
            TextButton(
              onPressed: () {
                // Close the dialog.
                Navigator.of(context).pop();
              },
              child: const Text('Yes'),
            ),
          ],
        );
      },
    );
  }
}
