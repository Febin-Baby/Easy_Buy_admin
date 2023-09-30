import 'package:easybuy_admin_app/controller/product_adding/dropdown_controller.dart';
import 'package:easybuy_admin_app/services/order_services.dart';
import 'package:easybuy_admin_app/view/core/colors.dart';
import 'package:easybuy_admin_app/view/core/constants.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class StatusChangerPopup extends StatelessWidget {
  const StatusChangerPopup(
      {super.key, required this.orderID, required this.ctx});
  final String orderID;
  final BuildContext ctx;

  @override
  Widget build(BuildContext context) {
    var displayHeight = MediaQuery.of(context).size.height;
    var displayWidth = MediaQuery.of(context).size.width;
    return AlertDialog(
      title: const Text(
        'Change Status',
        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
      ),
      contentPadding: EdgeInsets.symmetric(
        horizontal: displayWidth * 0.1,
        vertical: displayHeight * 0.01,
      ),
      content: ChangeNotifierProvider(
        create: (context) => DropdownController(
          item: statusList,
          value: statusList[0],
        ),
        child: Consumer<DropdownController>(
          builder: (context, dropcontro, _) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text('Status'),
                DropdownButton(
                  value: dropcontro.value,
                  isExpanded: true,
                  icon: const Icon(Icons.arrow_drop_down),
                  iconSize: kwidth * 0.08,
                  items: dropcontro.item.map(
                    (String components) {
                      return DropdownMenuItem(
                        value: components,
                        child: Text(components),
                      );
                    },
                  ).toList(),
                  onChanged: (value) {
                    // You don't need to call dropcontro.selectItem(value) here.
                    debugPrint('on changed $value');
                    dropcontro.selectItem(value!);
                    confirmation(selectedChange: value, orderID: orderID);
                  },
                ),
              ],
            );
          },
        ),
      ),
    );
  }

  confirmation({required String selectedChange, required String orderID}) {
    String date = dateFinder(selectedChange);
    debugPrint('admin page staus cahne selected date$date');
    showDialog(
      context: ctx,
      builder: (context) => AlertDialog(
        title: const Row(
          children: [
            Text(
              'Attention',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ],
        ),
        content: const Text(
          'Are you sure to proceed, Because once you updated it cannot be undone',
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: const Text(
              'Cancel',
            ),
          ),
          TextButton(
            onPressed: () {
              OrderService().orderStatusUpdat(
                recieveDate: date,
                orderId: orderID,
                currentStatus: selectedChange,
              );
              Navigator.of(context).pop();
            },
            child: const Text(
              'Update',
              style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
  }

  String dateFinder(String value) {
    switch (value) {
      case 'order placed':
        return 'orderPlacedDate';
      case 'Order Shipped':
        return 'shippingDate';
      case 'Out For Delivery':
        return 'outForDeliveryDate';
      default:
        return '';
    }
  }
}
