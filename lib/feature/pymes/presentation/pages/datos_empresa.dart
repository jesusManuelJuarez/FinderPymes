import 'package:finder_pymes/feature/pymes/presentation/widgets/four_step_register_pymes.dart';
import 'package:finder_pymes/feature/pymes/presentation/widgets/oneStepRegisterPymes.dart';
import 'package:finder_pymes/feature/pymes/presentation/widgets/three_step_register_pymes.dart';
import 'package:finder_pymes/feature/pymes/presentation/widgets/two_step_register_pymes.dart';
import 'package:finder_pymes/settings/size_responsive.dart';
import 'package:finder_pymes/settings/styles/colors.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/stepper_state.dart';

class DatosEmpresaPage extends StatelessWidget {
  final PageController _pageController = PageController();

  DatosEmpresaPage({super.key});

  @override
  Widget build(BuildContext context) {
    bool isKeyboardPresent(BuildContext context) {
      return !(MediaQuery.of(context).viewInsets.bottom == 0.0);
    }

    return Scaffold(
      body: SafeArea(
        child: LayoutBuilder(builder:
            (BuildContext context, BoxConstraints viewportConstraints) {
          bool scrollable =
              SizeResponsize.sizeScreenHeigth < viewportConstraints.maxHeight;
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
                      padding: const EdgeInsets.symmetric(horizontal: 10),
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
                    const Divider(
                      thickness: 2,
                      color: Color.fromARGB(255, 190, 190, 190),
                    ),
                    SizedBox(
                      height: SizeResponsize.sizeScreenHeigth,
                      child: allSteppers(context),
                    ),
                  ],
                ),
              ),
            ),
          );
        }),
      ),
    );
  }

  Align allSteppers(BuildContext context) {
    return Align(
      alignment: Alignment.topCenter,
      child: Container(
        height: SizeResponsize.blockSizeVertical(80),
        margin: EdgeInsets.symmetric(
          horizontal: SizeResponsize.textSize(10),
          vertical: SizeResponsize.textSize(5),
        ),
        decoration: BoxDecoration(
          color: DataColors.colorWhite,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 2,
              blurRadius: 2,
              offset: const Offset(0, 3),
            )
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: PageView.builder(
            controller: _pageController,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: 4,
            itemBuilder: (context, index) {
              switch (index) {
                case 0:
                  return OneStepRegisterPymes(
                    pageController: _pageController,
                  );
                case 1:
                  return TwoStepRegisterPymes(
                    pageController: _pageController,
                  );
                case 2:
                  return ThreeStepRegisterPymes(
                      pageController: _pageController);
                case 3:
                  return FourStepRegisterPymes(
                    pageController: _pageController,
                  );
              }
              return Container();
            },
          ),
        ),
      ),
    );
  }
}

// ignore: must_be_immutable
class Stepper extends StatelessWidget {
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

  final List<String> titles = [
    'Datos básicos',
    'Inf. Encargado',
    'Personalizar',
    'Plan'
  ];

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
            ),
          );
  }
}
