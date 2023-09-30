import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class OrderService {
  orderStatusUpdat({
  required String recieveDate,
  required String orderId,
  required String currentStatus,
}) async {
  try {
    debugPrint('Updating order status...');
    var docSnapshot = await FirebaseFirestore.instance
        .collection('order')
        .doc(orderId)
        .get();

    if (docSnapshot.exists) {
      var data = docSnapshot.data();
      if (data != null && data[recieveDate] == 'Not setted') {
        String date = DateTime.now().toString();
        await FirebaseFirestore.instance
            .collection('order')
            .doc(orderId)
            .update({recieveDate: date, 'orderStatus': currentStatus});
        debugPrint('Order status updated successfully!');
        
      } else {
        debugPrint(recieveDate);
        debugPrint('Order status was already set.');
      }
    } else {
      debugPrint('Document with ID $orderId does not exist.');
    }
  } catch (e) {
    debugPrint('Error updating order status: $e');
  }
}

}
