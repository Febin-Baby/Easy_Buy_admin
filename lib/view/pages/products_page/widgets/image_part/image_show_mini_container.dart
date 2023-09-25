import 'dart:io';
import 'package:easybuy_admin_app/controller/product_adding/product_image_controller.dart';
import 'package:easybuy_admin_app/view/core/colors.dart';
import 'package:flutter/material.dart';

class ImageAddingContainers extends StatelessWidget {
  
  const ImageAddingContainers({super.key, required this.productImagecontroller});
  final ProductImageController productImagecontroller;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: khieght * 0.05,
      child: Center(
        child: ListView.separated(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          separatorBuilder: (context, index) => SizedBox(width: kwidth * 0.05),
          itemCount: productImagecontroller.imagelist.length > 4
              ? 5
              : productImagecontroller.imagelist.length + 1,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) => InkWell(
            onTap: () {
              if (index == productImagecontroller.imagelist.length) {
                productImagecontroller.imageAdd(index: index);
              } else {
                productImagecontroller.changeIndex(index: index);
              }
            },
            child: Container(
              decoration: BoxDecoration(color: Colors.grey, border: Border.all()),
              width: kwidth * 0.115,
              child: index != productImagecontroller.imagelist.length
                  ? Image.file(File(productImagecontroller.imagelist[index]))
                  : Center(child: Icon(Icons.add, color: white, size: khieght * 0.035)),
            ),
          ),
        ),
      ),
    );
  }
}
