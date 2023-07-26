import 'package:flutter/material.dart';

class TextFormFieldPymes extends StatelessWidget {
  final String label;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final Color borderColor;
  final TextInputType typeKeyboard;
  final bool obscureText;

  const TextFormFieldPymes(
      {super.key,
      required this.label,
      this.controller,
      this.validator,
      required this.borderColor,
      required this.typeKeyboard,
      required this.obscureText});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        hintText: label,
        border: OutlineInputBorder(
          borderSide: BorderSide(
            width: 1,
            color: borderColor,
          ),
          borderRadius: const BorderRadius.all(
            Radius.circular(10),
          ),
        ),
      ),
      keyboardType: typeKeyboard,
      obscureText: obscureText,
      validator: validator,
    );
  }
}