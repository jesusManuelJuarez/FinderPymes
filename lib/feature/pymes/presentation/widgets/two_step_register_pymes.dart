// ignore_for_file: body_might_complete_normally_nullable

import 'package:finder_pymes/feature/pymes/presentation/providers/stepper_state.dart';
import 'package:finder_pymes/feature/pymes/presentation/widgets/richart_text_custom.dart';
import 'package:finder_pymes/feature/pymes/presentation/widgets/textformfield_stteper_pymes.dart';
import 'package:finder_pymes/settings/size_responsive.dart';
import 'package:finder_pymes/settings/styles/colors.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TwoStepRegisterPymes extends StatelessWidget {
  final PageController pageController;
  final TextEditingController rfcController;
  final TextEditingController regimenFiscal;
  final TextEditingController domicilioFiscal;
  const TwoStepRegisterPymes({
    super.key,
    required this.pageController,
    required this.rfcController,
    required this.regimenFiscal,
    required this.domicilioFiscal,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: SizeResponsize.safeBlockVertical(65.0),
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          const CustomRichaText(
            label: 'RFC',
            optional: true,
          ),
          TextFormFieldPymes(
            label: 'RFC de la empresa',
            borderColor: DataColors.colorBlack,
            typeKeyboard: TextInputType.text,
            obscureText: false,
            validator: (value) {},
          ),
          const CustomRichaText(
            label: 'Regimen Fiscal',
            optional: true,
          ),
          TextFormFieldPymes(
            label: 'Regimen Fiscal de la empresa',
            borderColor: DataColors.colorBlack,
            typeKeyboard: TextInputType.text,
            obscureText: false,
            validator: (value) {},
          ),
          const CustomRichaText(
            label: 'Domicilio Fiscal',
            optional: true,
          ),
          TextFormFieldPymes(
            label: 'Domicilio Fiscal de la empresa',
            borderColor: DataColors.colorBlack,
            typeKeyboard: TextInputType.text,
            obscureText: false,
            validator: (value) {},
          ),
          SizedBox(
            height: SizeResponsize.blockSizeVertical(28),
          ),
          SizedBox(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(
                        const Color.fromRGBO(95, 95, 95, 1)),
                    minimumSize: MaterialStateProperty.all<Size>(Size(
                        SizeResponsize.blockSizeHorizontal(40),
                        50)), // Tamaño mínimo
                  ),
                  onPressed: () {
                    var stepperState =
                        Provider.of<StepperState>(context, listen: false);
                    stepperState.setIndex(stepperState.currentIndex - 1);
                    pageController.animateToPage(
                      stepperState.currentIndex,
                      duration: const Duration(milliseconds: 300),
                      curve: Curves.easeIn,
                    );
                  },
                  child: const Text(
                    'Atrás',
                    style: TextStyle(fontSize: 20),
                  ),
                ),
                ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(
                        const Color.fromRGBO(4, 104, 252, 1)),
                    minimumSize: MaterialStateProperty.all<Size>(Size(
                        SizeResponsize.blockSizeHorizontal(40),
                        50)), // Tamaño mínimo
                  ),
                  onPressed: () {
                    var stepperState =
                        Provider.of<StepperState>(context, listen: false);
                    stepperState.setIndex(stepperState.currentIndex + 1);
                    pageController.animateToPage(
                      stepperState.currentIndex,
                      duration: const Duration(milliseconds: 300),
                      curve: Curves.easeIn,
                    );
                  },
                  child: const Text(
                    'Continuar',
                    style: TextStyle(fontSize: 20),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
