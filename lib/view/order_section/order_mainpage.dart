import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easybuy_admin_app/model/user_app_model.dart/order_model.dart';
import 'package:easybuy_admin_app/view/core/colors.dart';
import 'package:easybuy_admin_app/view/core/constants.dart';
import 'package:easybuy_admin_app/view/order_section/widgets/order_container.dart';
import 'package:easybuy_admin_app/view/order_section/widgets/order_detail.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class OrderMainScreen extends StatelessWidget {
  const OrderMainScreen({super.key});
  static const orderRoute = '/OrderScreen';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
        stream: FirebaseFirestore.instance.collection('order').snapshots(),
        builder: (context, snapshot) {
          if (snapshot.data == null) {
            return Lottie.asset(embtyLottie);
          }
          return ListView.separated(
            separatorBuilder: (context, index) {
              return selectHieght(khieght*.02);
            },
            itemCount: snapshot.data!.docs.length,
            itemBuilder: (context, index) {
              OrderModell orderData =
                  OrderModell.fromMap(snapshot.data!.docs[index]);
              DateTime? dateTime =
                  DateTime.tryParse(orderData.orderPlacedDate!);
              String razor = orderData.israzorpay == true
                  ? 'Razorpay'
                  : 'cash on delivery';
              return InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => OrderDetail(
                        orderiD: snapshot.data!.docs[index].id,
                        orderData: orderData,
                        dateTime: dateTime,
                        razor: razor,
                      ),
                    ),
                  );
                },
                child: OrderContainer(
                  orderData: orderData,
                  dateTime: dateTime!,
                  razor: razor,
                ),
              );
            },
          );
        },
      ),
    );
  }
}
