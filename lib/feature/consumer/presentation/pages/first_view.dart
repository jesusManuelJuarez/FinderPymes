import 'package:finder_pymes/feature/consumer/presentation/pages/login.dart';
import 'package:finder_pymes/feature/consumer/presentation/pages/option_register.dart';
import 'package:finder_pymes/feature/consumer/presentation/widgets/bottom_customer.dart';
import 'package:finder_pymes/settings/size_responsive.dart';
import 'package:flutter/material.dart';
import 'package:finder_pymes/settings/styles/colors.dart';

class FirstViewPage extends StatelessWidget {
  const FirstViewPage({super.key});

  @override
  Widget build(BuildContext context) {
    double sizeText = SizeResponsize.textSize(5.092592595539695);

    return Scaffold(
      backgroundColor: DataColors.colorPinkBackground,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: DataColors.colorTransparent,
      ),
      body: Column(
        children: [
          Expanded(
            flex: 4,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Image.asset('assets/images/logo_no_letters.png'),
                Text(
                  'FinderPymes',
                  style: TextStyle(
                    color: DataColors.colorWhite,
                    fontSize: sizeText,
                  ),
                  textAlign: TextAlign.center,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: SizeResponsize.textSize(12.731482)),
                  child: Text(
                    'Descubre promociones exclusivas y apoya a las PYMES de tu localidad con FinderPymes. \n ¡Conéctate, ahorra y disfruta!',
                    style: TextStyle(
                      color: DataColors.colorWhite,
                      fontSize: sizeText,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                SizedBox(
                  height: SizeResponsize.safeBlockVertical(7),
                )
              ],
            ),
          ),
          Expanded(
            flex: 3,
            child: Container(
              width: SizeResponsize.sizeScreenWidth,
              decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(50),
                    topRight: Radius.circular(50),
                  ),
                  color: DataColors.colorWhite13Trasnparent),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  CustomerElevateBottom(
                    label: 'Registrate',
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const OptionRegister(),
                        ),
                      );
                    },
                    backgroundColor: DataColors.colorWhite,
                    textColor: DataColors.colorBlueText,
                    sizeHorizontal: SizeResponsize.textSize(7),
                  ),
                  CustomerElevateBottom(
                    label: 'Inicia Sesión',
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const LoginConsumer(),
                        ),
                      );
                    },
                    backgroundColor: DataColors.colorBlueBottom,
                    textColor: DataColors.colorWhite,
                    sizeHorizontal: SizeResponsize.textSize(6),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
