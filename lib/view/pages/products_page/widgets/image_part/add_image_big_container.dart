import 'dart:io';
import 'package:easybuy_admin_app/controller/product_adding/product_image_controller.dart';
import 'package:easybuy_admin_app/view/core/colors.dart';
import 'package:flutter/material.dart';

class ImageShower extends StatelessWidget {
  const ImageShower({super.key, required this.imageController});
  final ProductImageController imageController;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: khieght * 0.2,
          width: kwidth * 0.95,
          color: kgrey,
          child: imageController.selectedIndex == null
              ? InkWell(
                  onTap: () {
                    imageController.imageAdd(index: 0);
                  },
                  child: Center(
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text('Add Image', style: interwhitebold),
                        const Icon(Icons.add, color: white),
                      ],
                    ),
                  ),
                )
              : Image.file(
                  File(
                    imageController.imagelist[imageController.selectedIndex!],
                  ),
                ),
        ),
        Positioned(
          right: 0,
          top: 0,
          child: imageController.selectedIndex == null
              ? const SizedBox()
              : IconButton(
                  onPressed: () {
                    if (imageController.selectedIndex != null) {
                      deleteAlertDialog(context);
                    }
                  },
                  icon: const Icon(Icons.delete),
                  color: black,
                  style: const ButtonStyle(
                    backgroundColor: MaterialStatePropertyAll(
                      Color.fromARGB(187, 151, 151, 151),
                    ),
                  ),
                ),
        ),
      ],
    );
  }

  Future deleteAlertDialog(BuildContext context) {
    return showDialog(
      context: context,
      builder: (context) => AlertDialog(
        content: const Text('Are you sure, you want to delete?'),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () {
              imageController.imageRemove(
                  index: imageController.selectedIndex!);
              Navigator.pop(context);
            },
            child: const Text('Sure'),
          ),
        ],
      ),
    );
  }
}
