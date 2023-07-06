// ignore_for_file: file_names, non_constant_identifier_names

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
            Icons.arrow_back,
            color: Color.fromRGBO(241, 135, 137, 1),
          ),
          onPressed: () {},
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(height: 10),
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
              height: MediaQuery.of(context).size.height *
                  0.7, // Ajusta esto según tus necesidades
              child: PageView.builder(
                controller: _pageController,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: 4,
                itemBuilder: (context, index) {
                  switch (index) {
                    case 0:
                      return Step1();
                    case 1:
                      return Step2();
                    case 2:
                      return Step3();
                    case 3:
                      return Step4();
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
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                children: [
                  GestureDetector(
                    onTap: onTap,
                    child: Container(
                      width: 35,
                      height: 35,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100),
                        color: index == currentIndex
                            ? const Color.fromRGBO(241, 135, 137, 1)
                            : const Color.fromRGBO(95, 95, 95, 1),
                        border: Border.all(
                            color: currentIndex >= index
                                ? const Color.fromRGBO(241, 135, 137, 1)
                                : Colors.transparent),
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
                width: 80.0,
                height: 25.0,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: index == currentIndex
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
              const SizedBox(
                height: 20.0,
              )
            ],
          )
        : Expanded(
            child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  GestureDetector(
                    onTap: onTap,
                    child: Container(
                      width: 35,
                      height: 35,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100),
                        color: index == currentIndex
                            ? const Color.fromRGBO(241, 135, 137, 1)
                            : const Color.fromRGBO(95, 95, 95, 1),
                        border: Border.all(
                            color: currentIndex >= index
                                ? const Color.fromRGBO(241, 135, 137, 1)
                                : Colors.transparent),
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
                  ),
                  Expanded(
                      child: Container(
                    width: 20.0,
                    height: 2,
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
                width: 80.0,
                height: 25.0,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: index == currentIndex
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
              const SizedBox(
                height: 20.0,
              )
            ],
          ));
  }
}

Widget Step1() {
  return Column(
    children: [
      Container(
        margin: const EdgeInsets.symmetric(horizontal: 20.0),
        height: 300,
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
            children: [
              const SizedBox(
                height: 20,
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
              Form(
                child: TextFormField(
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
                  validator: (value) {
                    if (value != null && RegExp(r'[0-9]').hasMatch(value)) {
                      return 'Solo se acepta texto';
                    }
                    return null;
                  },
                  onChanged: (value) {
                    // Tu lógica aquí
                  },
                ),
              )
            ],
          ),
        ),
      ),
    ],
  );
}

Widget Step2() {
  return Column(
    children: [
      Container(
        margin: const EdgeInsets.symmetric(horizontal: 20),
        height: 35.0,
        width: double.infinity,
        decoration: const BoxDecoration(
          color: Color.fromARGB(255, 23, 120, 89),
        ),
      ),
    ],
  );
}

Widget Step3() {
  return Container(
    height: 35.0,
    width: 35.0,
    decoration: const BoxDecoration(
      color: Color.fromARGB(255, 37, 17, 149),
    ),
  );
}

Widget Step4() {
  return Container(
    height: 35.0,
    width: 35.0,
    decoration: const BoxDecoration(
      color: Color.fromARGB(255, 175, 35, 35),
    ),
  );
}
