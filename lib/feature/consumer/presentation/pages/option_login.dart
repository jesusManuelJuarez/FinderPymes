import 'package:finder_pymes/feature/consumer/presentation/pages/login.dart';
import 'package:finder_pymes/feature/consumer/presentation/widgets/bottom_customer.dart';
import 'package:finder_pymes/settings/size_responsive.dart';
import 'package:finder_pymes/settings/styles/colors.dart';
import 'package:flutter/material.dart';

class VED001 extends StatelessWidget {
  const VED001({super.key});

  //TODO: Esta vista esta en desuso...

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: DataColors.colorPinkBackground,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: DataColors.colorTransparent,
      ),
      body: Column(
        children: [
          Expanded(
            flex: 2,
            child: Image.asset('assets/images/logo_no_letters.png'),
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
                  SizedBox(
                    child: Column(
                      children: [
                        const Padding(
                          padding: EdgeInsets.only(right: 100.0, bottom: 10),
                          child: Text(
                            '¿Eres un Consumidor?',
                            style: TextStyle(
                              fontSize: 20,
                              color: DataColors.colorWhite,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        CustomerElevateBottom(
                          label: 'Inicie Sesión',
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const LoginConsumer(),
                              ),
                            );
                          },
                          backgroundColor: DataColors.colorWhite,
                          textColor: DataColors.colorBlueText,
                          sizeHorizontal: 25,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    child: Column(
                      children: [
                        const Padding(
                          padding: EdgeInsets.only(right: 100.0, bottom: 10),
                          child: Text(
                            'O ¿Eres un Negocio?',
                            style: TextStyle(
                              fontSize: 20,
                              color: DataColors.colorWhite,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        CustomerElevateBottom(
                          label: 'Inicie Sesión',
                          onPressed: () {},
                          backgroundColor: DataColors.colorBlueBottom,
                          textColor: DataColors.colorWhite,
                          sizeHorizontal: 25,
                        ),
                      ],
                    ),
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
