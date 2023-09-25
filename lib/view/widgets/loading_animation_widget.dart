import 'package:easybuy_admin_app/view/core/colors.dart';
import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class Loading extends StatelessWidget {
  const Loading({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Center(
        child: LoadingAnimationWidget.inkDrop(
          color: const Color.fromARGB(255, 9, 198, 255),
          size: kwidth * 0.13,
        ),
      ),
    );
  }
}
