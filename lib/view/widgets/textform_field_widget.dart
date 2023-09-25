// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:easybuy_admin_app/view/core/colors.dart';
import 'package:flutter/material.dart';

class TTextFormField extends StatelessWidget {
  final String text;
  final IconData preffix;
  final TextEditingController controller;
  final TextInputType inputType;
  final bool obscureText;
  final VoidCallback? function;
  final int? maxlines;
  const TTextFormField(
      {Key? key,
      required this.text,
      required this.preffix,
      required this.controller,
      required this.inputType,
      required this.obscureText,
      this.function,
      this.maxlines})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: SizedBox(
        child: TextFormField(
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Please $text';
            }
            if (text == 'Enter product Description' && value.length < 10) {
              return 'Description must contain at least 10 letters';
            }
            if (text == 'Enter product price' && !isValidPrice(value)) {
              return 'Please enter a valid price';
            }
            if (text == 'Enter product dicount' && !isValidDiscount(value)) {
              return 'Please Enter percentage';
            }
            return null;
          },
          maxLines: maxlines,
          obscureText: obscureText,
          controller: controller,
          keyboardType: inputType,
          decoration: InputDecoration(
            alignLabelWithHint: true,
            fillColor: const Color.fromARGB(255, 241, 241, 241),
            filled: true,
            hintText: text,
            hintStyle: greey,
            prefixIcon: Icon(
              preffix,
              size: 17,
              color: purpple,
            ),
            border: UnderlineInputBorder(
              borderRadius: BorderRadius.circular(7),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(7),
              borderSide: const BorderSide(
                color: Colors.grey,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(7),
              borderSide: const BorderSide(
                color: Colors.green,
              ),
            ),
          ),
        ),
      ),
    );
  }

  bool isValidPrice(String value) {
    if (value.isEmpty) return false;

    try {
      final price = double.parse(value);
      if (price <= 0) return false;
      return true;
    } catch (e) {
      return false;
    }
  }

  bool isValidDiscount(String value) {
    if (value.isEmpty) return false;

    try {
      final discount = double.parse(value);
      if (discount < 0 || discount > 100) return false;
      return true;
    } catch (e) {
      return false;
    }
  }
}
