import 'package:finder_pymes/settings/size_responsive.dart';
import 'package:finder_pymes/settings/styles/colors.dart';
import 'package:flutter/material.dart';

class CustomerCategory extends StatelessWidget {
  final double sizeTextTittle;
  final String urlImage;
  final String label;
  final bool longSize;
  const CustomerCategory({
    super.key,
    required this.sizeTextTittle,
    required this.urlImage,
    required this.label,
    required this.longSize,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: SizeResponsize.textSize(18)),
      child: Container(
        height: SizeResponsize.blockSizeVertical(15),
        width:
            longSize ? double.infinity : SizeResponsize.blockSizeHorizontal(40),
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(
            Radius.circular(20),
          ),
          image: DecorationImage(
            image: AssetImage(urlImage),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: Container(
            width: double.infinity,
            height: SizeResponsize.blockSizeVertical(7),
            color: DataColors.colorWhite65Transparent,
            child: Center(
              child: Text(
                label,
                style: TextStyle(
                  fontSize: sizeTextTittle,
                  color: DataColors.colorBlack,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
