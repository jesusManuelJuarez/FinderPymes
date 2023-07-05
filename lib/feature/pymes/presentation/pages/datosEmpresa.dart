// ignore_for_file: file_names

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
      body: Column(
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
                      )),
            ),
          ),
          Expanded(
              child: PageView.builder(
                  controller: _pageController,
                  itemCount: 4,
                  itemBuilder: (context, index) {
                    switch (index) {
                      case 0:
                        return Container(
                          height: 35.0,
                          width: 35.0,
                          decoration: const BoxDecoration(
                            color: Colors.red,
                          ),
                        );
                      case 1:
                        return Container(
                          height: 50.0,
                          width: 50.0,
                          decoration: const BoxDecoration(
                            color: Color.fromARGB(255, 184, 75, 67),
                          ),
                        );
                      case 2:
                        return Container(
                          height: 50.0,
                          width: 50.0,
                          decoration: const BoxDecoration(
                            color: Color.fromARGB(255, 176, 193, 180),
                          ),
                        );
                      case 3:
                        return Container(
                          height: 50.0,
                          width: 50.0,
                          decoration: const BoxDecoration(
                            color: Color.fromARGB(255, 56, 15, 138),
                          ),
                        );
                      case 4:
                        return Container(
                          height: 50.0,
                          width: 50.0,
                          decoration: const BoxDecoration(
                            color: Color.fromARGB(255, 54, 244, 146),
                          ),
                        );
                    }
                    return null;
                  })),
        ],
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
                                  : Colors.transparent)),
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
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    minimumSize: const Size(15.0, 15.0),
                    backgroundColor: index == currentIndex
                        ? const Color.fromRGBO(241, 135, 137, 1)
                        : const Color.fromRGBO(95, 95, 95, 1),
                  ),
                  onPressed: () {},
                  child: const Text(
                    'En progreso',
                    style: TextStyle(fontSize: 10, color: Colors.white),
                  ))
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
                                  : Colors.transparent)),
                    ),
                  ),
                  Expanded(
                      child: Container(
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
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    minimumSize: const Size(15.0, 15.0),
                    backgroundColor: index == currentIndex
                        ? const Color.fromRGBO(241, 135, 137, 1)
                        : const Color.fromRGBO(95, 95, 95, 1),
                  ),
                  onPressed: () {},
                  child: const Text(
                    'En progreso',
                    style: TextStyle(fontSize: 10, color: Colors.white),
                  ))
            ],
          ));
  }
}
