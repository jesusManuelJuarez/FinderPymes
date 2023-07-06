import 'package:flutter/material.dart';

class CustomerTextFormField extends StatelessWidget {
  final String label;
  final Icon iconSuffixIcon;
  final Color borderColor;
  final TextInputType typeKeyboard;
  final bool obscureText;
  const CustomerTextFormField({
    super.key,
    required this.label,
    required this.iconSuffixIcon,
    required this.borderColor,
    required this.typeKeyboard,
    required this.obscureText
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
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
      keyboardType: typeKeyboard,
      obscureText: obscureText,
      validator: (value) {},
    );
  }
}