import 'dart:io';

import 'package:finder_pymes/feature/pymes/presentation/providers/image_picker_provider.dart';
import 'package:finder_pymes/feature/pymes/presentation/providers/stepper_state.dart';
import 'package:finder_pymes/feature/pymes/presentation/widgets/richart_text_custom.dart';
import 'package:finder_pymes/settings/size_responsive.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ThreeStepRegisterPymes extends StatefulWidget {
  final PageController pageController;
  final TextEditingController urlProfileController;
  final TextEditingController urlBannerController;
  const ThreeStepRegisterPymes({
    super.key,
    required this.pageController,
    required this.urlProfileController,
    required this.urlBannerController,
  });

  @override
  State<ThreeStepRegisterPymes> createState() => _ThreeStepRegisterPymesState();
}

class _ThreeStepRegisterPymesState extends State<ThreeStepRegisterPymes> {
  @override
  Widget build(BuildContext context) {
    final imagenPickerPymes = Provider.of<ImagePickerProviderPymes>(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        CustomRichaText(
          label: 'Agrega un Banner a tu PYME',
          optional: false,
          styleText: TextStyle(
            color: const Color.fromRGBO(242, 142, 144, 1),
            fontSize: SizeResponsize.textSize(20),
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(
          width: SizeResponsize.blockSizeHorizontal(100),
          height: SizeResponsize.blockSizeVertical(20),
          child: Center(
            child: widget.urlBannerController.text.isEmpty
                ? GestureDetector(
                    onTap: () async {
                      String urlBanner = '';
                      File? image = await imagenPickerPymes.getImage();
                      if (image != null) {
                        urlBanner = await imagenPickerPymes.uploadImage(
                            image, 'banner');
                        setState(() {
                          widget.urlBannerController.text = urlBanner;
                        });
                      }
                    },
                    child: Container(
                      width: SizeResponsize.blockSizeHorizontal(20),
                      height: SizeResponsize.blockSizeVertical(20),
                      decoration: const BoxDecoration(
                        color: Color.fromRGBO(242, 142, 144, 1),
                        shape: BoxShape.circle,
                      ),
                      child: const Icon(
                        Icons.camera,
                        color: Colors.white,
                        size: 40,
                      ),
                    ),
                  )
                : Image.network(widget.urlBannerController.text),
          ),
        ),
        CustomRichaText(
          label: 'Agrega un Foto de Perfil a tu PYME',
          optional: false,
          styleText: TextStyle(
            color: const Color.fromRGBO(242, 142, 144, 1),
            fontSize: SizeResponsize.textSize(20),
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(
          width: SizeResponsize.blockSizeHorizontal(100),
          height: SizeResponsize.blockSizeVertical(20),
          child: Center(
            child: widget.urlProfileController.text.isEmpty
                ? GestureDetector(
                    onTap: () async {
                      String urlProfile = '';
                      File? image = await imagenPickerPymes.getImage();
                      if (image != null) {
                        urlProfile = await imagenPickerPymes.uploadImage(
                            image, 'profile');
                        setState(() {
                          widget.urlProfileController.text = urlProfile;
                        });
                      }
                    },
                    child: Container(
                      width: SizeResponsize.blockSizeHorizontal(20),
                      height: SizeResponsize.blockSizeVertical(20),
                      decoration: const BoxDecoration(
                        color: Color.fromRGBO(242, 142, 144, 1),
                        shape: BoxShape.circle,
                      ),
                      child: const Icon(
                        Icons.camera,
                        color: Colors.white,
                        size: 40,
                      ),
                    ),
                  )
                : Image.network(widget.urlProfileController.text),
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
                  widget.pageController.animateToPage(
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
                  widget.pageController.animateToPage(
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
  }
}
