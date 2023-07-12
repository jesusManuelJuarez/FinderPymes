// ignore_for_file: file_names, non_constant_identifier_names

import 'package:dotted_border/dotted_border.dart';
import 'package:finder_pymes/settings/size_responsive.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'stepper_state.dart';

class DatosEmpresaPage extends StatelessWidget {
  final PageController _pageController = PageController();

  DatosEmpresaPage({super.key});

  @override
  Widget build(BuildContext context) {
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
      body: SingleChildScrollView(
        physics: const NeverScrollableScrollPhysics(),
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
              const SizedBox(
                height: 5,
              ),
              RichText(
                  text: const TextSpan(children: [
                TextSpan(
                  text: 'Nombre de la empresa ',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 15,
                  ),
                ),
                TextSpan(
                    text: '*',
                    style: TextStyle(
                        color: Color.fromRGBO(242, 142, 144, 1),
                        fontSize: 15,
                        fontWeight: FontWeight.bold))
              ])),
              TextFormField(
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.transparent,
                  hintText: "Ingrese nombre de la empresa",
                  hintStyle:
                      const TextStyle(color: Color.fromRGBO(95, 95, 95, 1)),
                  errorStyle: const TextStyle(color: Colors.redAccent),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: const BorderSide(
                        color: Color.fromRGBO(242, 142, 144,
                            1)), // Color del borde en estado normal.
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: const BorderSide(
                        color: Color.fromRGBO(242, 142, 144,
                            1)), // Color del borde en estado enfocado.
                  ),
                ),
              ),
              RichText(
                  text: const TextSpan(children: [
                TextSpan(
                  text: 'Descripción de la empresa ',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 15,
                  ),
                ),
                TextSpan(
                    text: '*',
                    style: TextStyle(
                        color: Color.fromRGBO(242, 142, 144, 1),
                        fontSize: 15,
                        fontWeight: FontWeight.bold))
              ])),
              TextFormField(
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.transparent,
                  hintText: "Escribe una breve descripción de tu empresa",
                  hintStyle:
                      const TextStyle(color: Color.fromRGBO(95, 95, 95, 1)),
                  errorStyle: const TextStyle(color: Colors.redAccent),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: const BorderSide(
                        color: Color.fromRGBO(242, 142, 144,
                            1)), // Color del borde en estado normal.
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: const BorderSide(
                        color: Color.fromRGBO(242, 142, 144,
                            1)), // Color del borde en estado enfocado.
                  ),
                ),
              ),
              RichText(
                  text: const TextSpan(children: [
                TextSpan(
                  text: 'Tipo de industria ',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 15,
                  ),
                ),
                TextSpan(
                    text: '*',
                    style: TextStyle(
                        color: Color.fromRGBO(242, 142, 144, 1),
                        fontSize: 15,
                        fontWeight: FontWeight.bold))
              ])),
              TextFormField(
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.transparent,
                  hintText: "Indique la actividad principal de su empresa",
                  hintStyle:
                      const TextStyle(color: Color.fromRGBO(95, 95, 95, 1)),
                  errorStyle: const TextStyle(color: Colors.redAccent),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: const BorderSide(
                        color: Color.fromRGBO(242, 142, 144,
                            1)), // Color del borde en estado normal.
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: const BorderSide(
                        color: Color.fromRGBO(242, 142, 144,
                            1)), // Color del borde en estado enfocado.
                  ),
                ),
              ),
              RichText(
                  text: const TextSpan(children: [
                TextSpan(
                  text: 'Sitio web ',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 15,
                  ),
                ),
                TextSpan(
                    text: '(opcional)',
                    style: TextStyle(
                        color: Color.fromRGBO(95, 95, 95, 1),
                        fontSize: 15,
                        fontWeight: FontWeight.bold))
              ])),
              TextFormField(
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.transparent,
                  hintText: "Pon aqui el link de tu sitio web o red social",
                  hintStyle:
                      const TextStyle(color: Color.fromRGBO(95, 95, 95, 1)),
                  errorStyle: const TextStyle(color: Colors.redAccent),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: const BorderSide(
                        color: Color.fromRGBO(242, 142, 144,
                            1)), // Color del borde en estado normal.
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: const BorderSide(
                        color: Color.fromRGBO(242, 142, 144,
                            1)), // Color del borde en estado enfocado.
                  ),
                ),
              ),
              SizedBox(
                width: double.infinity,
                child: OutlinedButton(
                  onPressed: () {
                    // aquí puedes manejar la acción de presionar el botón
                  },
                  style: OutlinedButton.styleFrom(
                    backgroundColor: Colors.transparent, // fondo transparente
                    side: const BorderSide(
                        color: Color.fromRGBO(
                            242, 142, 144, 1)), // bordes de color
                  ),
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Datos de contacto',
                        style:
                            TextStyle(color: Color.fromRGBO(242, 142, 144, 1)),
                      ),
                      Icon(Icons.chevron_right,
                          color: Color.fromRGBO(
                              242, 142, 144, 1)), // icono Chevron-Right
                    ],
                  ),
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
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const SizedBox(
                height: 5,
              ),
              RichText(
                  text: const TextSpan(children: [
                TextSpan(
                  text: 'RFC ',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 15,
                  ),
                ),
                TextSpan(
                    text: '(opcional)',
                    style: TextStyle(
                        color: Color.fromRGBO(95, 95, 95, 1),
                        fontSize: 15,
                        fontWeight: FontWeight.bold))
              ])),
              TextFormField(
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.transparent,
                  hintText: "Ingrese su RFC con homoclave ",
                  hintStyle:
                      const TextStyle(color: Color.fromRGBO(95, 95, 95, 1)),
                  errorStyle: const TextStyle(color: Colors.redAccent),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: const BorderSide(
                        color: Color.fromRGBO(242, 142, 144,
                            1)), // Color del borde en estado normal.
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: const BorderSide(
                        color: Color.fromRGBO(242, 142, 144,
                            1)), // Color del borde en estado enfocado.
                  ),
                ),
              ),
              RichText(
                  text: const TextSpan(children: [
                TextSpan(
                  text: 'Regimen fiscal ',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 15,
                  ),
                ),
                TextSpan(
                    text: '(opcional)',
                    style: TextStyle(
                        color: Color.fromRGBO(95, 95, 95, 1),
                        fontSize: 15,
                        fontWeight: FontWeight.bold))
              ])),
              TextFormField(
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.transparent,
                  hintText: "Ingrese su regimen fiscal",
                  hintStyle:
                      const TextStyle(color: Color.fromRGBO(95, 95, 95, 1)),
                  errorStyle: const TextStyle(color: Colors.redAccent),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: const BorderSide(
                        color: Color.fromRGBO(242, 142, 144,
                            1)), // Color del borde en estado normal.
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: const BorderSide(
                        color: Color.fromRGBO(242, 142, 144,
                            1)), // Color del borde en estado enfocado.
                  ),
                ),
              ),
              RichText(
                  text: const TextSpan(children: [
                TextSpan(
                  text: 'Domicilio fiscal ',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 15,
                  ),
                ),
                TextSpan(
                    text: '(opcional)',
                    style: TextStyle(
                        color: Color.fromRGBO(95, 95, 95, 1),
                        fontSize: 15,
                        fontWeight: FontWeight.bold))
              ])),
              TextFormField(
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.transparent,
                  hintText: "En caso de tener, ingrese su domicilio fiscal",
                  hintStyle:
                      const TextStyle(color: Color.fromRGBO(95, 95, 95, 1)),
                  errorStyle: const TextStyle(color: Colors.redAccent),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: const BorderSide(
                        color: Color.fromRGBO(242, 142, 144,
                            1)), // Color del borde en estado normal.
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: const BorderSide(
                        color: Color.fromRGBO(242, 142, 144,
                            1)), // Color del borde en estado enfocado.
                  ),
                ),
              ),
              SizedBox(
                height: SizeResponsize.blockSizeVertical(20.0),
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
        ),
      ),
    ],
  );
}

Widget Step3(PageController pageController, BuildContext context) {
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
              const SizedBox(
                height: 5,
              ),
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
                strokeWidth: 2,
                child: SizedBox(
                  width: SizeResponsize.blockSizeHorizontal(100),
                  height: SizeResponsize.blockSizeVertical(20),
                  child: Center(
                    child: IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.camera,
                          color: const Color.fromRGBO(242, 142, 144, 1),
                          size: MediaQuery.of(context).size.width * 0.1,
                        )),
                  ),
                ),
              ),
              SizedBox(
                height: SizeResponsize.blockSizeVertical(25.0),
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
        ),
      ),
    ],
  );
}

Widget Step4(PageController pageController, BuildContext context) {
  return Container(
    height: 35.0,
    width: 35.0,
    decoration: const BoxDecoration(
      color: Color.fromARGB(255, 175, 35, 35),
    ),
  );
}
