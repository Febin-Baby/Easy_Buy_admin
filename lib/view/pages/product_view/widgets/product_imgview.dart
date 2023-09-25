import 'package:easybuy_admin_app/view/core/colors.dart';
import 'package:easybuy_admin_app/view/widgets/loading_animation_widget.dart';
import 'package:flutter/material.dart';

class ProductPageview extends StatelessWidget {
  final List imagelist;
  const ProductPageview({super.key, required this.imagelist});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: khieght * 0.5,
      width: double.infinity,
      child: PageView.builder(
        itemCount: imagelist.length,
        itemBuilder: (context, index) {
          return SizedBox(
            width: double.infinity,
            child: Image.network(
              imagelist[index],
              errorBuilder: (context, error, stackTrace) => const ColoredBox(
                color: Colors.grey,
                child: Loading(),
              ),
            ),
          );
        },
      ),
    );
  }
}
