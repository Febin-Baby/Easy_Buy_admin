import 'dart:io';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:easybuy_admin_app/view/widgets/loading_animation_widget.dart';
import 'package:flutter/material.dart';

class ImageContainer extends StatelessWidget {
  const ImageContainer({
    super.key,
    required this.imagePath,
    required this.width,
    required this.height,
    this.fromNetwork = false,
  });
  final String? imagePath;
  final double width;
  final double height;
  final bool fromNetwork;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: imagePath == null
          ? const Center(
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text('Add brand image'),
                  Icon(Icons.add)
                ],
              ),
            )
          : fromNetwork
              ? CachedNetworkImage(
                  imageUrl: imagePath!,
                  placeholder: (context, url) => const Loading(),
                  errorWidget: (context, url, error) => const Icon(Icons.error),
                )
              : Image.file(File(imagePath!)),
    );
  }
}
