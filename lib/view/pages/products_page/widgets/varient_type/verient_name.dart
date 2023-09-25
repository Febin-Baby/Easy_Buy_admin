// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:easybuy_admin_app/view/core/colors.dart';
import 'package:flutter/material.dart';

class VarientNameContainer extends StatelessWidget {
  const VarientNameContainer({
    Key? key,
    required this.text,
    required this.onTap,
  }) : super(key: key);
  final String text;
  final Function() onTap;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 255, 232, 251),
        borderRadius: BorderRadius.circular(kwidth * 0.04),
      ),
      child: Stack(
        children: [
          Padding(
            padding: EdgeInsets.only(left: kwidth * 0.02, top: khieght * 0.01),
            child: SizedBox(child: Text(text)),
          ),
          Positioned(
            right: 0,
            top: khieght * 0.008,
            child: InkWell(
              onTap: onTap,
              child: Container(
                width: kwidth * 0.1,
                decoration:
                    const BoxDecoration(shape: BoxShape.circle, color: black),
                child: const Icon(Icons.close, color: white),
              ),
            ),
          )
        ],
      ),
    );
  }
}
