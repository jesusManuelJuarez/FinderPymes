import 'package:finder_pymes/feature/consumer/presentation/widgets/textformfield_customer.dart';
import 'package:finder_pymes/feature/post/presentation/widgets/bottom_navbar.dart';
import 'package:finder_pymes/settings/size_responsive.dart';
import 'package:finder_pymes/settings/styles/colors.dart';
import 'package:flutter/material.dart';

class SearchView extends StatelessWidget {
  const SearchView({super.key});

  @override
  Widget build(BuildContext context) {
    double sizeTextTittle = SizeResponsize.textSize(20);
    // double sizeTextNormal = SizeResponsize.textSize(5.092592887);
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: SingleChildScrollView(
          child: SizedBox(
            width: SizeResponsize.sizeScreenWidth,
            height: SizeResponsize.blockSizeVertical(18),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Align(
                  alignment: Alignment.center,
                  child: Text(
                    '¿Que desea Buscar?',
                    style: TextStyle(
                      fontSize: sizeTextTittle,
                      color: DataColors.colorPinkBackground,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: SizeResponsize.textSize(15)),
                  child: const CustomerTextFormField(
                    label: 'Buscar servicios o productos',
                    iconSuffixIcon: Icon(Icons.search),
                    borderColor: DataColors.colorBlack,
                    typeKeyboard: TextInputType.text,
                    obscureText: false,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: customBottomNavigationBar(3, context),
    );
  }
}
