import 'package:flutter/material.dart';

class Boldtext extends StatelessWidget {
  const Boldtext({super.key, required this.text});
  final String text;
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: const TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w500,
        fontFamily: 'Lora',
      ),
    );
  }
}

class Boldtext18 extends StatelessWidget {
  const Boldtext18({super.key, required this.text});
  final String text;
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: const TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.w800,
        fontFamily: 'Lora',
      ),
    );
  }
}

selectHieght(double? height) {
  return SizedBox(
    height: height,
  );
}

const String password = 'Admin@123';
const String email = 'admin@gmail.com';

