// ignore_for_file: file_names, non_constant_identifier_names, prefer_typing_uninitialized_variables
import 'package:dotted_border/dotted_border.dart';
import 'package:finder_pymes/feature/pymes/presentation/widgets/step1.dart';
import 'package:finder_pymes/feature/pymes/presentation/widgets/stepper2.dart';
import 'package:finder_pymes/settings/size_responsive.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'image_picker_provider.dart';
import 'stepper_state.dart';

class DatosEmpresaPage extends StatelessWidget {
  final PageController _pageController = PageController();

  DatosEmpresaPage({super.key});

  @override
  Widget build(BuildContext context) {
    bool isKeyboardPresent(BuildContext context) {
      return !(MediaQuery.of(context).viewInsets.bottom == 0.0);
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios,
            color: Color.fromRGBO(241, 135, 137, 1),
          ),
          onPressed: () {},
        ),
      ),
      body: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints viewportConstraints) {
        bool scrollable =
            MediaQuery.of(context).size.height < viewportConstraints.maxHeight;
        bool isKeyboard = isKeyboardPresent(context);
        return SingleChildScrollView(
          physics: scrollable || isKeyboard
              ? const AlwaysScrollableScrollPhysics()
              : const NeverScrollableScrollPhysics(),
          child: ConstrainedBox(
            constraints: BoxConstraints(
              minHeight: viewportConstraints.maxHeight,
            ),
            child: IntrinsicHeight(
              child: Column(
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Row(
                      children: List.generate(
                        4,
                        (index) => Stepper(
                          currentIndex:
                              Provider.of<StepperState>(context).currentIndex,
                          index: index,
                          isLast: index == 3,
                          onTap: () {
                            Provider.of<StepperState>(context, listen: false)
                                .setIndex(index);
                            _pageController.jumpToPage(index);
                          },
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: SizeResponsize.sizeScreenHeigth,
                    child: PageView.builder(
                      controller: _pageController,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: 4,
                      itemBuilder: (context, index) {
                        switch (index) {
                          case 0:
                            return Step1(_pageController, context);
                          case 1:
                            return Step2(_pageController, context);
                          case 2:
                            return Step3(_pageController, context);
                          case 3:
                            return Step4(_pageController, context);
                        }
                        return Container();
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      }),
    );
  }
}

// ignore: must_be_immutable
class Stepper extends StatelessWidget {
  final List<String> titles = [
    'Datos básicos',
    'Inf. Encargado',
    'Personalizar',
    'Plan'
  ];
  int index;
  int currentIndex;

  VoidCallback onTap;
  bool isLast;
  Stepper(
      {super.key,
      required this.currentIndex,
      required this.index,
      required this.onTap,
      this.isLast = false});

  @override
  Widget build(BuildContext context) {
    return isLast
        ? Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: 35,
                    height: 35,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                      color: index <= currentIndex
                          ? const Color.fromRGBO(241, 135, 137, 1)
                          : const Color.fromRGBO(95, 95, 95, 1),
                      border: Border.all(
                          color: currentIndex >= index
                              ? const Color.fromRGBO(95, 95, 95, 1)
                              : const Color.fromRGBO(95, 95, 95, 1)),
                    ),
                    child: Center(
                      child: index == currentIndex
                          ? const Icon(Icons.edit,
                              color: Colors
                                  .white) // Icono de edición para el paso actual.
                          : (currentIndex > index
                              ? const Icon(Icons.check,
                                  color: Colors
                                      .white) // Icono de check para los pasos completados.
                              : null), // Nada para los pasos que aún no se han alcanzado.
                    ),
                  ),
                  if (!isLast)
                    Expanded(
                        child: Container(
                      height: 1,
                      color: currentIndex >= index + 1
                          ? const Color.fromRGBO(241, 135, 137, 1)
                          : Colors.black,
                    ))
                ],
              ),
              Text(
                'PASO ${index + 1}',
                style: const TextStyle(
                    color: Color.fromRGBO(95, 95, 95, 1), fontSize: 14),
              ),
              Text(
                titles[index],
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              Container(
                width: SizeResponsize.blockSizeHorizontal(20),
                height: SizeResponsize.blockSizeVertical(3),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: index <= currentIndex
                      ? const Color.fromRGBO(241, 135, 137, 1)
                      : const Color.fromRGBO(95, 95, 95, 1),
                ),
                child: Center(
                  child: Text(
                    currentIndex > index ? 'Completado' : 'En progreso',
                    style: const TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ],
          )
        : Expanded(
            child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: 35,
                    height: 35,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                      color: index <= currentIndex
                          ? const Color.fromRGBO(241, 135, 137, 1)
                          : const Color.fromRGBO(95, 95, 95, 1),
                      border: Border.all(
                          color: currentIndex >= index
                              ? const Color.fromRGBO(95, 95, 95, 1)
                              : const Color.fromRGBO(95, 95, 95, 1)),
                    ),
                    child: Center(
                      child: index == currentIndex
                          ? const Icon(Icons.edit,
                              color: Colors
                                  .white) // Icono de edición para el paso actual.
                          : (currentIndex > index
                              ? const Icon(Icons.check,
                                  color: Colors
                                      .white) // Icono de check para los pasos completados.
                              : null), // Nada para los pasos que aún no se han alcanzado.
                    ),
                  ),
                  Expanded(
                      child: Container(
                    height: 1,
                    color: currentIndex >= index + 1
                        ? const Color.fromRGBO(241, 135, 137, 1)
                        : const Color.fromRGBO(95, 95, 95, 1),
                  ))
                ],
              ),
              Text(
                'PASO ${index + 1}',
                style: const TextStyle(
                    color: Color.fromRGBO(95, 95, 95, 1), fontSize: 14),
              ),
              Text(
                titles[index],
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              Container(
                width: SizeResponsize.blockSizeHorizontal(20),
                height: SizeResponsize.blockSizeVertical(3),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: index <= currentIndex
                      ? const Color.fromRGBO(241, 135, 137, 1)
                      : const Color.fromRGBO(95, 95, 95, 1),
                ),
                child: Center(
                  child: Text(
                    currentIndex > index ? 'Completado' : 'En progreso',
                    style: const TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ],
          ));
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

Widget Step3(PageController pageController, BuildContext context) {
  return Consumer<ImagePickerProvider>(
    builder: (context, imagePicker, child) {
      return Column(
        children: [
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
            padding: const EdgeInsets.symmetric(vertical: 10),
            height: SizeResponsize.safeBlockVertical(75.0),
            width: double.infinity,
            decoration: BoxDecoration(
                color: const Color.fromARGB(255, 255, 255, 255),
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 4,
                    blurRadius: 4,
                    offset: const Offset(0, 3),
                  )
                ]),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  RichText(
                      text: TextSpan(children: [
                    TextSpan(
                      text:
                          'Agrega imagenes para darle más identidad a tu negocio ',
                      style: TextStyle(
                          color: const Color.fromRGBO(242, 142, 144, 1),
                          fontSize: MediaQuery.of(context).size.width * 0.06,
                          fontWeight: FontWeight.bold),
                    ),
                    TextSpan(
                        text: '(Tres minimo)',
                        style: TextStyle(
                          color: const Color.fromRGBO(95, 95, 95, 1),
                          fontSize: MediaQuery.of(context).size.width * 0.05,
                        ))
                  ])),
                  DottedBorder(
                    color: const Color.fromRGBO(95, 95, 95, 1),
                    strokeWidth: 1,
                    child: SizedBox(
                      width: SizeResponsize.blockSizeHorizontal(100),
                      height: SizeResponsize.blockSizeVertical(10),
                      child: Center(
                        child: IconButton(
                            onPressed: () {
                              opciones(
                                  context,
                                  Provider.of<ImagePickerProvider>(context,
                                      listen: false));
                            },
                            icon: Icon(
                              Icons.camera,
                              color: const Color.fromRGBO(242, 142, 144, 1),
                              size: MediaQuery.of(context).size.width * 0.1,
                            )),
                      ),
                    ),
                  ),
                  imagePicker.imagen != null
                      ? Image.file(imagePicker.imagen!)
                      : SizedBox(
                          width: SizeResponsize.safeBlockHorizontal(25),
                          height: SizeResponsize.blockSizeHorizontal(5),
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
                            var stepperState = Provider.of<StepperState>(
                                context,
                                listen: false);
                            stepperState
                                .setIndex(stepperState.currentIndex - 1);
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
                            var stepperState = Provider.of<StepperState>(
                                context,
                                listen: false);
                            stepperState
                                .setIndex(stepperState.currentIndex + 1);
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
            ),
          ),
        ],
      );
    },
  );
}

Widget Step1(PageController pageController, BuildContext context) {
  return Column(
    children: [
      Container(
        margin: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
        padding: const EdgeInsets.symmetric(vertical: 10),
        height: SizeResponsize.safeBlockVertical(75.0),
        width: double.infinity,
        decoration: BoxDecoration(
            color: const Color.fromARGB(255, 255, 255, 255),
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 2,
                blurRadius: 2,
                offset: const Offset(0, 3),
              )
            ]),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Stepper1(),
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
              )
            ],
          ),
        ),
      ),
    ],
  );
}

Widget Step2(PageController pageController, BuildContext context) {
  return Column(
    children: [
      Container(
        margin: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
        padding: const EdgeInsets.symmetric(vertical: 10),
        height: SizeResponsize.safeBlockVertical(75.0),
        width: double.infinity,
        decoration: BoxDecoration(
            color: const Color.fromARGB(255, 255, 255, 255),
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 4,
                blurRadius: 4,
                offset: const Offset(0, 3),
              )
            ]),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Stepper2(),
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
        ),
      ),
    ],
  );
}

Widget Step4(PageController pageController, BuildContext context) {
  return Column(
    children: [
      Container(
        margin: EdgeInsets.symmetric(
          horizontal: SizeResponsize.safeBlockHorizontal(5),
        ),
        height: SizeResponsize.safeBlockVertical(75.0),
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Conoce nuestro planes',
              style: TextStyle(
                  fontSize: MediaQuery.of(context).size.width * 0.06,
                  color: const Color.fromRGBO(95, 95, 95, 1)),
            ),
            Container(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
              height: SizeResponsize.safeBlockVertical(24.5),
              width: double.infinity,
              decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 255, 255, 255),
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.6),
                      spreadRadius: 1,
                      blurRadius: 1,
                      offset: const Offset(0, 0),
                    )
                  ]),
              child: Column(
                children: [
                  Container(
                    padding: EdgeInsets.only(
                        left: SizeResponsize.safeBlockHorizontal(50)),
                    width: double.infinity,
                    height: 20,
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Gratuito',
                          style:
                              TextStyle(color: Color.fromRGBO(95, 95, 95, 1)),
                        ),
                        Spacer(),
                        Text(
                          'Premium',
                          style: TextStyle(
                            color: Color.fromRGBO(241, 135, 137, 1),
                          ),
                        )
                      ],
                    ),
                  ),
                  Container(
                    height: 1,
                    width: SizeResponsize.safeBlockHorizontal(90),
                    color: const Color.fromRGBO(95, 95, 95, 1),
                  ),
                  Column(
                    children: [
                      Row(
                        children: [
                          SizedBox(
                            width: SizeResponsize.safeBlockHorizontal(50),
                            child: Text(
                              'Carga ilimitada de datos',
                              style: TextStyle(
                                fontSize:
                                    MediaQuery.of(context).size.width * 0.033,
                              ),
                            ),
                          ),
                          Container(
                            width: SizeResponsize.safeBlockHorizontal(35),
                            padding: EdgeInsets.symmetric(
                                horizontal:
                                    SizeResponsize.safeBlockHorizontal(4)),
                            child: const Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Icon(
                                  Icons.check,
                                  color: Color.fromRGBO(241, 135, 137, 1),
                                ),
                                Icon(
                                  Icons.close,
                                  color: Color.fromRGBO(95, 95, 95, 1),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          SizedBox(
                            width: SizeResponsize.safeBlockHorizontal(50),
                            child: Text(
                              'Destacar en tendencias',
                              style: TextStyle(
                                fontSize:
                                    MediaQuery.of(context).size.width * 0.033,
                              ),
                            ),
                          ),
                          Container(
                            width: SizeResponsize.safeBlockHorizontal(35),
                            padding: EdgeInsets.symmetric(
                                horizontal:
                                    SizeResponsize.safeBlockHorizontal(4)),
                            child: const Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Icon(
                                  Icons.check,
                                  color: Color.fromRGBO(241, 135, 137, 1),
                                ),
                                Icon(
                                  Icons.close,
                                  color: Color.fromRGBO(95, 95, 95, 1),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          SizedBox(
                            width: SizeResponsize.safeBlockHorizontal(50),
                            child: Text(
                              'Reporte de visitas',
                              style: TextStyle(
                                fontSize:
                                    MediaQuery.of(context).size.width * 0.033,
                              ),
                            ),
                          ),
                          Container(
                            width: SizeResponsize.safeBlockHorizontal(35),
                            padding: EdgeInsets.symmetric(
                                horizontal:
                                    SizeResponsize.safeBlockHorizontal(4)),
                            child: const Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Icon(
                                  Icons.check,
                                  color: Color.fromRGBO(241, 135, 137, 1),
                                ),
                                Icon(
                                  Icons.close,
                                  color: Color.fromRGBO(95, 95, 95, 1),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          SizedBox(
                            width: SizeResponsize.safeBlockHorizontal(50),
                            child: Text(
                              'Cobros a través de plataforma',
                              style: TextStyle(
                                fontSize:
                                    MediaQuery.of(context).size.width * 0.033,
                              ),
                            ),
                          ),
                          Container(
                            width: SizeResponsize.safeBlockHorizontal(35),
                            padding: EdgeInsets.symmetric(
                                horizontal:
                                    SizeResponsize.safeBlockHorizontal(4)),
                            child: const Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Icon(
                                  Icons.check,
                                  color: Color.fromRGBO(241, 135, 137, 1),
                                ),
                                Icon(
                                  Icons.close,
                                  color: Color.fromRGBO(95, 95, 95, 1),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          SizedBox(
                            width: SizeResponsize.safeBlockHorizontal(50),
                            child: Text(
                              'Citas a través de plataforma',
                              style: TextStyle(
                                fontSize:
                                    MediaQuery.of(context).size.width * 0.033,
                              ),
                            ),
                          ),
                          Container(
                            width: SizeResponsize.safeBlockHorizontal(35),
                            padding: EdgeInsets.symmetric(
                                horizontal:
                                    SizeResponsize.safeBlockHorizontal(4)),
                            child: const Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Icon(
                                  Icons.check,
                                  color: Color.fromRGBO(241, 135, 137, 1),
                                ),
                                Icon(
                                  Icons.close,
                                  color: Color.fromRGBO(95, 95, 95, 1),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  )
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
              margin: const EdgeInsets.symmetric(vertical: 5),
              height: SizeResponsize.safeBlockVertical(11),
              width: double.infinity,
              decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 255, 255, 255),
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.6),
                      spreadRadius: 1,
                      blurRadius: 1,
                      offset: const Offset(0, 0),
                    )
                  ]),
              child: Row(
                children: [
                  SizedBox(
                    width: SizeResponsize.safeBlockHorizontal(55),
                    height: SizeResponsize.safeBlockVertical(100),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '12 MESES',
                          style: TextStyle(
                              fontSize:
                                  MediaQuery.of(context).size.width * 0.03),
                        ),
                        RichText(
                            text: TextSpan(children: [
                          TextSpan(
                            text: '179.58 MXN*',
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize:
                                  MediaQuery.of(context).size.width * 0.04,
                            ),
                          ),
                          TextSpan(
                              text: ' /mes',
                              style: TextStyle(
                                  color: const Color.fromRGBO(95, 95, 95, 1),
                                  fontSize:
                                      MediaQuery.of(context).size.width * 0.03,
                                  fontWeight: FontWeight.bold))
                        ])),
                        RichText(
                            text: TextSpan(children: [
                          TextSpan(
                            text: ' 2.155 MXN*',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize:
                                  MediaQuery.of(context).size.width * 0.03,
                            ),
                          ),
                          TextSpan(
                              text: ' cada ',
                              style: TextStyle(
                                  color: const Color.fromRGBO(95, 95, 95, 1),
                                  fontSize:
                                      MediaQuery.of(context).size.width * 0.03,
                                  fontWeight: FontWeight.bold)),
                          TextSpan(
                              text: '12 ',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize:
                                      MediaQuery.of(context).size.width * 0.03,
                                  fontWeight: FontWeight.bold)),
                          TextSpan(
                              text: 'meses',
                              style: TextStyle(
                                  color: const Color.fromRGBO(95, 95, 95, 1),
                                  fontSize:
                                      MediaQuery.of(context).size.width * 0.03,
                                  fontWeight: FontWeight.bold))
                        ])),
                        Text(
                          ' Puede aplicarse IVA, o impuesto locales',
                          style: TextStyle(
                              fontSize:
                                  MediaQuery.of(context).size.width * 0.02,
                              color: const Color.fromRGBO(95, 95, 95, 1)),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    width: SizeResponsize.safeBlockHorizontal(30),
                    height: SizeResponsize.safeBlockVertical(100),
                    child: Center(
                      child: ElevatedButton(
                        style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all(
                                const Color.fromRGBO(242, 142, 144, 1))),
                        onPressed: () {},
                        child: const Text('Suscribirse'),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
              margin: const EdgeInsets.symmetric(vertical: 5),
              height: SizeResponsize.safeBlockVertical(11),
              width: double.infinity,
              decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 255, 255, 255),
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.6),
                      spreadRadius: 1,
                      blurRadius: 1,
                      offset: const Offset(0, 0),
                    )
                  ]),
              child: Row(
                children: [
                  SizedBox(
                    width: SizeResponsize.safeBlockHorizontal(55),
                    height: SizeResponsize.safeBlockVertical(100),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '1 MES ',
                          style: TextStyle(
                              fontSize:
                                  MediaQuery.of(context).size.width * 0.03),
                        ),
                        RichText(
                            text: TextSpan(children: [
                          TextSpan(
                            text: '299.99 MXN*',
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize:
                                  MediaQuery.of(context).size.width * 0.04,
                            ),
                          ),
                          TextSpan(
                              text: ' /mes',
                              style: TextStyle(
                                  color: const Color.fromRGBO(95, 95, 95, 1),
                                  fontSize:
                                      MediaQuery.of(context).size.width * 0.03,
                                  fontWeight: FontWeight.bold))
                        ])),
                        RichText(
                            text: TextSpan(children: [
                          TextSpan(
                            text: '299.99 MXN*',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize:
                                  MediaQuery.of(context).size.width * 0.03,
                            ),
                          ),
                          TextSpan(
                              text: ' cada ',
                              style: TextStyle(
                                  color: const Color.fromRGBO(95, 95, 95, 1),
                                  fontSize:
                                      MediaQuery.of(context).size.width * 0.03,
                                  fontWeight: FontWeight.bold)),
                          TextSpan(
                              text: 'mes ',
                              style: TextStyle(
                                  color: const Color.fromRGBO(95, 95, 95, 1),
                                  fontSize:
                                      MediaQuery.of(context).size.width * 0.03,
                                  fontWeight: FontWeight.bold)),
                        ])),
                        Text(
                          ' Puede aplicarse IVA, o impuesto locales',
                          style: TextStyle(
                              fontSize:
                                  MediaQuery.of(context).size.width * 0.02,
                              color: const Color.fromRGBO(95, 95, 95, 1)),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    width: SizeResponsize.safeBlockHorizontal(30),
                    height: SizeResponsize.safeBlockVertical(100),
                    child: Center(
                      child: ElevatedButton(
                        style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all(
                                const Color.fromRGBO(242, 142, 144, 1))),
                        onPressed: () {},
                        child: const Text('Suscribirse'),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
              margin: const EdgeInsets.symmetric(vertical: 5),
              height: SizeResponsize.safeBlockVertical(11),
              width: double.infinity,
              decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 255, 255, 255),
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.6),
                      spreadRadius: 1,
                      blurRadius: 1,
                      offset: const Offset(0, 0),
                    )
                  ]),
              child: Row(
                children: [
                  SizedBox(
                    width: SizeResponsize.safeBlockHorizontal(55),
                    height: SizeResponsize.safeBlockVertical(100),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'GRATUITO',
                          style: TextStyle(
                              fontSize:
                                  MediaQuery.of(context).size.width * 0.03),
                        ),
                        RichText(
                            text: TextSpan(children: [
                          TextSpan(
                            text: '0 MXN*',
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize:
                                  MediaQuery.of(context).size.width * 0.04,
                            ),
                          ),
                          TextSpan(
                              text: ' /mes',
                              style: TextStyle(
                                  color: const Color.fromRGBO(95, 95, 95, 1),
                                  fontSize:
                                      MediaQuery.of(context).size.width * 0.03,
                                  fontWeight: FontWeight.bold))
                        ])),
                        RichText(
                            text: TextSpan(children: [
                          TextSpan(
                            text: '0 MXN*',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize:
                                  MediaQuery.of(context).size.width * 0.03,
                            ),
                          ),
                          TextSpan(
                              text: ' cada mes',
                              style: TextStyle(
                                  color: const Color.fromRGBO(95, 95, 95, 1),
                                  fontSize:
                                      MediaQuery.of(context).size.width * 0.03,
                                  fontWeight: FontWeight.bold)),
                        ])),
                      ],
                    ),
                  ),
                  SizedBox(
                    width: SizeResponsize.safeBlockHorizontal(30),
                    height: SizeResponsize.safeBlockVertical(100),
                    child: Center(
                      child: ElevatedButton(
                        style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all(
                                const Color.fromRGBO(95, 95, 95, 1))),
                        onPressed: () {},
                        child: const Text('Suscribirse'),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            ElevatedButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(
                    const Color.fromRGBO(95, 95, 95, 1)),
                minimumSize: MaterialStateProperty.all<Size>(Size(
                    SizeResponsize.blockSizeHorizontal(100),
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
          ],
        ),
      ),
    ],
  );
}
