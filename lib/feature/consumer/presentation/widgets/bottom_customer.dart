import 'package:finder_pymes/settings/size_responsive.dart';
import 'package:flutter/material.dart';

class CustomerElevateBottom extends StatelessWidget {
  final String label;
  final VoidCallback onPressed;
  final Color backgroundColor;
  final Color textColor;
  final double sizeHorizontal;

  const CustomerElevateBottom({
    super.key,
    required this.label,
    required this.onPressed,
    required this.backgroundColor,
    required this.textColor,
    required this.sizeHorizontal,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all<Color>(backgroundColor),
        padding: MaterialStateProperty.all(
          EdgeInsets.symmetric(
            horizontal: SizeResponsize.safeBlockHorizontal(sizeHorizontal),
            vertical: SizeResponsize.safeBlockVertical(2.3),
          ),
        ),
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.0),
          ),
        ),
      ),
      onPressed: onPressed,
      child: Text(
        label,
        style: TextStyle(
          color: textColor,
          fontSize: SizeResponsize.textSize(15),
        ),
      ),
    );
  }
}
