import 'package:finder_pymes/settings/size_responsive.dart';
import 'package:finder_pymes/settings/styles/colors.dart';
import 'package:flutter/cupertino.dart';


class ButtomCustomProfile extends StatelessWidget {
  final String label;
  final void Function()? onTap;
  const ButtomCustomProfile({
    super.key,
    required this.label,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: label == 'Cerrar Sesión'
          ? const EdgeInsets.only(top: 100)
          : const EdgeInsets.only(top: 20),
      child: Container(
        height: SizeResponsize.blockSizeVertical(7),
        width: SizeResponsize.blockSizeHorizontal(90),
        decoration: BoxDecoration(
          color: DataColors.colorWhite,
          border: Border.all(
            color: label == 'Cerrar Sesión'
                ? const Color.fromARGB(255, 0, 0, 0)
                : DataColors.colorPinkSuave,
            width: 2.0,
          ),
          borderRadius: BorderRadius.circular(35.0),
        ),
        child: Row(
          children: [
            Expanded(
              flex: 3,
              child: Padding(
                padding: const EdgeInsets.only(left: 15),
                child: Text(
                  label,
                  style: TextStyle(
                      fontSize: 17,
                      color: label == 'Cerrar Sesión'
                          ? const Color(0xFF000000)
                          : DataColors.colorPinkBackground),
                ),
              ),
            ),
            Expanded(
              child: GestureDetector(
                onTap: onTap,
                child: Icon(
                  CupertinoIcons.right_chevron,
                  color:label == 'Cerrar Sesión'
                ? const Color.fromARGB(255, 0, 0, 0)
                : DataColors.colorPinkBackground,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}