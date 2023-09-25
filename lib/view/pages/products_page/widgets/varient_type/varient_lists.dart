// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:easybuy_admin_app/view/core/constants.dart';
import 'package:easybuy_admin_app/view/widgets/textform_field_widget.dart';
import 'package:flutter/material.dart';

import 'package:easybuy_admin_app/controller/product_adding/varients_adding_controller.dart';
import 'package:easybuy_admin_app/view/core/colors.dart';
import 'package:easybuy_admin_app/view/pages/products_page/widgets/varient_type/varient_grid.dart';

class VerientContainer extends StatelessWidget {
  VerientContainer({
    Key? key,
    required this.varientAddingController,
  }) : super(key: key);
  final VarientAddingController varientAddingController;
  final TextEditingController varientController=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(kwidth * 0.01),
      decoration: BoxDecoration(
        border: Border.all(),
        borderRadius: BorderRadius.circular(
          kwidth * 0.03,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('Varients'),
          VarientsGrid(varientAddingController: varientAddingController),
          SizedBox(
            child: Center(
              child: ElevatedButton(
                onPressed: () {
                  addVarientPopUp(context);
                },
                
                child: Text('Add Varients', style: interwhitebold),
              ),
            ),
          ),
        ],
      ),
    );
  }
  addVarientPopUp(
    BuildContext context,
  ) {
    return showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text(
          'Add Varient',
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TTextFormField(
              controller: varientController,
              inputType: TextInputType.name,
              obscureText: false,
              preffix: Icons.color_lens,
              text: 'Enter Color',
            ),
            selectHieght(khieght * 0.005),
            ElevatedButton(
              onPressed: () {
                String value = varientController.text.trim();
                varientAddingController.addVarient(value);
                Navigator.of(context).pop();
              },
              style: buttonStyle(),
              child: Text('Add Varient', style: interwhitebold),
            )
          ],
        ),
      ),
    );
  }

  ButtonStyle buttonStyle() {
    return const ButtonStyle(
      backgroundColor: MaterialStatePropertyAll(black),
      foregroundColor: MaterialStatePropertyAll(white),
    );
  } 

}
