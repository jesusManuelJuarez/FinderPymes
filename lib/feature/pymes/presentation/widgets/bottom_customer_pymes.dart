import 'package:finder_pymes/settings/size_responsive.dart';
import 'package:finder_pymes/settings/styles/colors.dart';
import 'package:flutter/cupertino.dart';

class BottomCustomRegisterPymes extends StatelessWidget {
  final String label;
  final void Function()? onTap;
  const BottomCustomRegisterPymes({
    super.key,
    required this.label,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: SizeResponsize.blockSizeVertical(6),
        decoration: BoxDecoration(
          color: DataColors.colorWhite,
          border: Border.all(
            color: DataColors.colorPinkBackground,
            width: 2.0,
          ),
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Row(
          children: [
            Expanded(
              flex: 5,
              child: Padding(
                padding: const EdgeInsets.only(left: 15),
                child: Text(
                  label,
                  style: const TextStyle(
                    fontSize: 17,
                    color: DataColors.colorPinkBackground,
                  ),
                ),
              ),
            ),
            const Expanded(
              child: Icon(
                CupertinoIcons.right_chevron,
                color: DataColors.colorPinkBackground,
              ),
            )
          ],
        ),
      ),
    );
  }
}
