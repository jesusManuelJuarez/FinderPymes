import 'package:finder_pymes/feature/consumer/presentation/pages/login.dart';
import 'package:finder_pymes/feature/consumer/presentation/pages/register.dart';
import 'package:finder_pymes/feature/consumer/presentation/provider/consumer_provider.dart';
import 'package:finder_pymes/feature/consumer/presentation/widgets/bottom_customer.dart';
import 'package:finder_pymes/settings/size_responsive.dart';
import 'package:flutter/material.dart';
import 'package:finder_pymes/settings/styles/colors.dart';
import 'package:provider/provider.dart';

class FirstViewPage extends StatelessWidget {
  const FirstViewPage({super.key});

  @override
  Widget build(BuildContext context) {
    double sizeText = SizeResponsize.textSize(15);
    ConsumerProvider consumerProvider = Provider.of<ConsumerProvider>(context);

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
                  padding: EdgeInsets.symmetric(
                      horizontal: SizeResponsize.textSize(15)),
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
                          builder: (context) => const RegisterConsumer(),
                        ),
                      );
                    },
                    backgroundColor: DataColors.colorWhite,
                    textColor: DataColors.colorBlueText,
                    sizeHorizontal: SizeResponsize.textSize(22),
                  ),
                  CustomerElevateBottom(
                    label: 'Inicia Sesión',
                    onPressed: () async {
                      await consumerProvider.getConsumers();
                      // ignore: avoid_print
                      print(consumerProvider.consumers!.length);
                      // ignore: use_build_context_synchronously
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const LoginConsumer(),
                        ),
                      );
                    },
                    backgroundColor: DataColors.colorBlueBottom,
                    textColor: DataColors.colorWhite,
                    sizeHorizontal: SizeResponsize.textSize(20),
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
