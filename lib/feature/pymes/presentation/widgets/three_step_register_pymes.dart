import 'package:finder_pymes/feature/pymes/presentation/providers/image_picker_provider.dart';
import 'package:finder_pymes/feature/pymes/presentation/providers/stepper_state.dart';
import 'package:finder_pymes/feature/pymes/presentation/widgets/richart_text_custom.dart';
import 'package:finder_pymes/settings/size_responsive.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ThreeStepRegisterPymes extends StatelessWidget {
  final PageController pageController;
  const ThreeStepRegisterPymes({super.key, required this.pageController});

  @override
  Widget build(BuildContext context) {
    return Consumer<ImagePickerProvider>(
      builder: (context, imagePicker, child) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            CustomRichaText(
              label: 'Agrega imagenes de tu Negocio',
              optional: true,
              styleText: TextStyle(
                color: const Color.fromRGBO(242, 142, 144, 1),
                fontSize: SizeResponsize.textSize(20),
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              width: SizeResponsize.blockSizeHorizontal(100),
              height: SizeResponsize.blockSizeVertical(10),
              child: Center(
                child: IconButton(
                  onPressed: () {
                    opciones(
                      context,
                      Provider.of<ImagePickerProvider>(context, listen: false),
                    );
                  },
                  icon: Icon(
                    Icons.camera,
                    color: const Color.fromRGBO(242, 142, 144, 1),
                    size: MediaQuery.of(context).size.width * 0.1,
                  ),
                ),
              ),
            ),
            SizedBox(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(
                        const Color.fromRGBO(95, 95, 95, 1),
                      ),
                      minimumSize: MaterialStateProperty.all<Size>(
                        Size(SizeResponsize.blockSizeHorizontal(40), 50),
                      ), // Tamaño mínimo
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
                        const Color.fromRGBO(4, 104, 252, 1),
                      ),
                      minimumSize: MaterialStateProperty.all<Size>(
                        Size(SizeResponsize.blockSizeHorizontal(40), 50),
                      ), // Tamaño mínimo
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
        );
      },
    );
  }
}

void opciones(BuildContext context, ImagePickerProvider imagePicker) {
  showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          contentPadding: const EdgeInsets.all(0),
          content: SingleChildScrollView(
            child: Column(
              children: [
                InkWell(
                  onTap: () {
                    imagePicker.selImagen(1);
                  },
                  child: Container(
                    padding: const EdgeInsets.all(20),
                    child: Row(
                      children: [
                        Expanded(
                            child: Text(
                          'Tomar una foto',
                          style: TextStyle(
                              fontSize:
                                  MediaQuery.of(context).size.width * 0.05),
                        )),
                        const Icon(Icons.photo_camera,
                            color: Color.fromRGBO(242, 142, 144, 1))
                      ],
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    imagePicker.selImagen(2);
                  },
                  child: Container(
                    padding: const EdgeInsets.all(20),
                    child: Row(
                      children: [
                        Expanded(
                            child: Text(
                          'Seleccionar una foto de la galeria',
                          style: TextStyle(
                              fontSize:
                                  MediaQuery.of(context).size.width * 0.05),
                        )),
                        const Icon(Icons.photo_library,
                            color: Color.fromRGBO(242, 142, 144, 1))
                      ],
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    Navigator.of(context).pop();
                  },
                  child: Container(
                    decoration: const BoxDecoration(color: Colors.red),
                    padding: const EdgeInsets.all(20),
                    child: Row(
                      children: [
                        Expanded(
                            child: Text(
                          'Cancelar',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: MediaQuery.of(context).size.width * 0.05,
                          ),
                          textAlign: TextAlign.center,
                        )),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      });
}

