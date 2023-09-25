import 'package:easybuy_admin_app/controller/product_adding/varients_adding_controller.dart';
import 'package:easybuy_admin_app/view/core/colors.dart';
import 'package:easybuy_admin_app/view/pages/products_page/widgets/varient_type/verient_name.dart';
import 'package:flutter/material.dart';

class VarientsGrid extends StatelessWidget {
  const VarientsGrid({super.key, required this.varientAddingController});
  final VarientAddingController varientAddingController;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: varientAddingController.varients.length,
      padding: EdgeInsets.symmetric(vertical: khieght * 0.01),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        crossAxisSpacing: kwidth * 0.03,
        mainAxisExtent: khieght * 0.045,
        mainAxisSpacing: khieght * 0.015,
      ),
      itemBuilder: (context, index) => VarientNameContainer(
        text: varientAddingController.varients[index],
        onTap: () {
          varientAddingController.deleteVarient(index);
        },
      ),
    );
  }
}
