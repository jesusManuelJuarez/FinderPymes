import 'package:flutter/material.dart';

class TextFormFieldPymes extends StatelessWidget {
  final String label;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final Icon? iconSuffixIcon;
  final Color borderColor;
  final TextInputType typeKeyboard;
  final bool obscureText;
  const TextFormFieldPymes({
    super.key,
    required this.label,
    this.controller,
    this.validator,
    this.iconSuffixIcon,
    required this.borderColor,
    required this.typeKeyboard,
    required this.obscureText,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      keyboardType: typeKeyboard,
      obscureText: obscureText,
      validator: validator,
      decoration: InputDecoration(
        hintText: label,
        suffixIcon: iconSuffixIcon,
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
    );
  }
}
