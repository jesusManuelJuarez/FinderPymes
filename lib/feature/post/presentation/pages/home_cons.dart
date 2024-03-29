import 'package:finder_pymes/feature/consumer/presentation/widgets/textformfield_customer.dart';
import 'package:finder_pymes/feature/post/presentation/widgets/bottom_navbar.dart';
import 'package:finder_pymes/feature/post/presentation/widgets/category.dart';
import 'package:finder_pymes/settings/size_responsive.dart';
import 'package:finder_pymes/settings/styles/colors.dart';
import 'package:flutter/material.dart';

class HomeFirst extends StatelessWidget {
  const HomeFirst({super.key});

  @override
  Widget build(BuildContext context) {
    double sizeTextTittle = SizeResponsize.textSize(5.092592887);
    // double sizeTextNormal = SizeResponsize.textSize(3.8194447);
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(
              width: double.infinity,
              height: SizeResponsize.blockSizeVertical(18),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(
                          right: SizeResponsize.textSize(38.19444665)),
                      child: Text(
                        'Bienvenido...',
                        style: TextStyle(
                          fontSize: sizeTextTittle,
                          color: DataColors.colorPinkBackground,
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: SizeResponsize.textSize(7.638889331)),
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
            Expanded(
              child: Padding(
                padding: EdgeInsets.only(
                  left: SizeResponsize.textSize(6.365741109),
                  right: SizeResponsize.textSize(6.365741109),
                ),
                child: Column(
                  children: [
                    CustomerCategory(
                      sizeTextTittle: sizeTextTittle,
                      urlImage:
                          'https://i.pinimg.com/564x/16/0d/57/160d57579422a3e257e613342a514808.jpg',
                      label: 'Medicos',
                      longSize: true,
                    ),
                    SizedBox(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CustomerCategory(
                            sizeTextTittle: sizeTextTittle,
                            urlImage:
                                'https://i.pinimg.com/564x/13/fc/2d/13fc2d4d1f2ebe02cecfc59642021fff.jpg',
                            label: 'Restaurantes',
                            longSize: false,
                          ),
                          CustomerCategory(
                            sizeTextTittle: sizeTextTittle,
                            urlImage:
                                'https://i.pinimg.com/564x/79/23/ec/7923ec6931f9e357dc293ebb3a8df6df.jpg',
                            label: 'Farmacias',
                            longSize: false,
                          ),
                        ],
                      ),
                    ),
                    CustomerCategory(
                      sizeTextTittle: sizeTextTittle,
                      urlImage:
                          'https://i.pinimg.com/564x/18/49/96/184996a68ddf518ce4758e73b5544e3e.jpg',
                      label: 'Mecanico',
                      longSize: true,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: customBottomNavigationBar(1, context),
    );
  }
}
