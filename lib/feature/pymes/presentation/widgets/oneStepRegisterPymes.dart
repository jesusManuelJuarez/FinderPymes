import 'package:finder_pymes/feature/pymes/presentation/providers/stepper_state.dart';
import 'package:finder_pymes/feature/pymes/presentation/widgets/bottom_customer_pymes.dart';
import 'package:finder_pymes/feature/pymes/presentation/widgets/category_dropdownbottom.dart';
import 'package:finder_pymes/feature/pymes/presentation/widgets/richart_text_custom.dart';
import 'package:finder_pymes/feature/pymes/presentation/widgets/textformfield_stteper_pymes.dart';
import 'package:finder_pymes/settings/styles/colors.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../settings/size_responsive.dart';

class OneStepRegisterPymes extends StatelessWidget {
  final PageController? pageController;
  final TextEditingController? nameController;
  final TextEditingController? descriptionController;
  final TextEditingController? urlController;
  const OneStepRegisterPymes({
    super.key,
    this.pageController,
    this.nameController,
    this.descriptionController,
    this.urlController,
  });

  @override
  Widget build(BuildContext context) {
    final keyFormRegisterPymes = GlobalKey<FormState>();
    return Form(
      key: keyFormRegisterPymes,
      child: SizedBox(
        height: SizeResponsize.safeBlockVertical(65.0),
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            const CustomRichaText(
              label: 'Nombre de la Empresa',
              optional: false,
            ),
            TextFormFieldPymes(
              label: 'Ingrese el nombre de la empresa',
              borderColor: DataColors.colorBlack,
              obscureText: false,
              typeKeyboard: TextInputType.name,
              controller: nameController,
            ),
            const CustomRichaText(
              label: 'Descripción de la empresa',
              optional: false,
            ),
            TextFormFieldPymes(
              label: 'Escribe una breve descripción',
              borderColor: DataColors.colorBlack,
              typeKeyboard: TextInputType.text,
              obscureText: false,
              controller: descriptionController,
            ),
            const CustomRichaText(
              label: 'Categoria de Negocio',
              optional: false,
            ),
            SizedBox(
              width: SizeResponsize.sizeScreenWidth,
              height: SizeResponsize.blockSizeVertical(6),
              child: CategoryDropdown(),
            ),
            const CustomRichaText(
              label: 'Sitio Web',
              optional: true,
            ),
            TextFormFieldPymes(
              label: 'URL',
              borderColor: DataColors.colorBlack,
              typeKeyboard: TextInputType.url,
              obscureText: false,
              controller: urlController,
            ),
            SizedBox(
              width: double.infinity,
              child: BottomCustomRegisterPymes(
                label: 'Datos de contacto',
                onTap: () {},
              ),
            ),
            SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(
                      const Color.fromRGBO(4, 104, 252, 1)),
                ),
                onPressed: () {
                  var stepperState =
                      Provider.of<StepperState>(context, listen: false);
                  stepperState.setIndex(stepperState.currentIndex + 1);
                  pageController!.animateToPage(
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
            ),
          ],
        ),
      ),
    );
  }
}
