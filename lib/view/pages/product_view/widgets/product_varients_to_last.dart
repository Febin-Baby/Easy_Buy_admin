import 'package:easybuy_admin_app/view/core/colors.dart';
import 'package:easybuy_admin_app/view/core/constants.dart';
import 'package:flutter/material.dart';

class ProductVarientsToLast extends StatelessWidget {
  const ProductVarientsToLast({super.key, required this.varients});
  final List varients;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _titletext('Available varients'),
        selectHieght(khieght * 0.01),
        GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 4,
            mainAxisExtent: khieght * 0.045,
            crossAxisSpacing: khieght * 0.005,
            mainAxisSpacing: khieght * 0.005,
          ),
          shrinkWrap: true,
          itemCount: varients.length,
          physics: const NeverScrollableScrollPhysics(),
          itemBuilder: (context, index) => Center(
            child: Container(
              decoration: BoxDecoration(
                color: kgrey,
                borderRadius: BorderRadius.circular(15),
              ),
              child: Center(child: Text(varients[index])),
            ),
          ),
        ),
        selectHieght(khieght * 0.01),
      ],
    );
  }

  Widget _titletext(String text) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        selectHieght(khieght * 0.01),
        Text(
          text,
        ),
      ],
    );
  }
}
