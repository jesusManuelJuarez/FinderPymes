import 'package:finder_pymes/feature/consumer/presentation/pages/register.dart';
import 'package:finder_pymes/feature/consumer/presentation/widgets/bottom_customer.dart';
import 'package:finder_pymes/feature/pymes/presentation/pages/registerPymes.dart';
import 'package:finder_pymes/settings/size_responsive.dart';
import 'package:finder_pymes/settings/styles/colors.dart';
import 'package:flutter/material.dart';

class OptionRegister extends StatelessWidget {
  const OptionRegister({super.key});

  @override
  Widget build(BuildContext context) {
    double sizeText = SizeResponsize.textSize(5.092592887);
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
                        Padding(
                          padding: EdgeInsets.only(right: SizeResponsize.textSize(25.46296444), bottom: SizeResponsize.textSize(2.546296444)),
                          child: Text(
                            '¿Eres un Consumidor?',
                            style: TextStyle(
                              fontSize: sizeText,
                              color: DataColors.colorWhite,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        CustomerElevateBottom(
                          label: 'Registrese',
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
                          sizeHorizontal: SizeResponsize.textSize(6.365741109),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    child: Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(right: SizeResponsize.textSize(25.46296444), bottom: SizeResponsize.textSize(2.546296444)),
                          child: Text(
                            'O ¿Eres una PYME?',
                            style: TextStyle(
                              fontSize: sizeText,
                              color: DataColors.colorWhite,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        CustomerElevateBottom(
                          label: 'Registrese',
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const RegisterPymesPage(),
                              ),
                            );
                          },
                          backgroundColor: DataColors.colorBlueBottom,
                          textColor: DataColors.colorWhite,
                          sizeHorizontal: SizeResponsize.textSize(6.365741109),
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
