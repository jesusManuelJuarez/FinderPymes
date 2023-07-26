import 'package:flutter/material.dart';

class CustomRichaText extends StatelessWidget {
  final String label;
  final bool optional;
  final TextStyle? styleText;
  const CustomRichaText({
    required this.label,
    required this.optional,
    this.styleText,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        children: [
          TextSpan(
            text: label,
            // ignore: prefer_if_null_operators
            style: styleText == null
                ? const TextStyle(
                    color: Color.fromRGBO(100, 100, 100, 1),
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                  )
                : styleText,
          ),
          optional
              ? const TextSpan(
                  text: '  (opcional)',
                  style: TextStyle(
                    color: Color.fromRGBO(100, 100, 100, 1),
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                  ),
                )
              : const TextSpan(
                  text: '  *',
                  style: TextStyle(
                      color: Color.fromRGBO(242, 142, 144, 1),
                      fontSize: 15,
                      fontWeight: FontWeight.bold),
                ),
        ],
      ),
    );
  }
}
