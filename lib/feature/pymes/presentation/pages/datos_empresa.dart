import 'package:finder_pymes/feature/pymes/presentation/providers/pymes_provider.dart';
import 'package:finder_pymes/feature/pymes/presentation/widgets/four_step_register_pymes.dart';
import 'package:finder_pymes/feature/pymes/presentation/widgets/one_step_register_pymes.dart';
import 'package:finder_pymes/feature/pymes/presentation/widgets/three_step_register_pymes.dart';
import 'package:finder_pymes/feature/pymes/presentation/widgets/two_step_register_pymes.dart';
import 'package:finder_pymes/feature/sources/presentation/pages/home_cons.dart';
import 'package:finder_pymes/settings/size_responsive.dart';
import 'package:finder_pymes/settings/styles/colors.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/stepper_state.dart';

class DatosEmpresaPage extends StatefulWidget {
  const DatosEmpresaPage({super.key});

  @override
  State<DatosEmpresaPage> createState() => _DatosEmpresaPageState();
}

class _DatosEmpresaPageState extends State<DatosEmpresaPage> {
  final PageController _pageController = PageController();

  TextEditingController nameController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  TextEditingController categoriaController = TextEditingController();
  TextEditingController urlController = TextEditingController();
  TextEditingController rfcController = TextEditingController();
  TextEditingController regimenController = TextEditingController();
  TextEditingController domicilioController = TextEditingController();
  TextEditingController urlProfileController = TextEditingController();
  TextEditingController urlBannerController = TextEditingController();
  TextEditingController planController = TextEditingController();

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

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  Align allSteppers(BuildContext context) {
    final pymesProvider = Provider.of<PymesProvider>(context);
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
                    nameController: nameController,
                    descriptionController: descriptionController,
                    categoriaController: categoriaController,
                    urlController: urlController,
                  );
                case 1:
                  return TwoStepRegisterPymes(
                    pageController: _pageController,
                    rfcController: rfcController,
                    regimenFiscal: regimenController,
                    domicilioFiscal: domicilioController,
                  );
                case 2:
                  return ThreeStepRegisterPymes(
                    pageController: _pageController,
                    urlProfileController: urlProfileController,
                    urlBannerController: urlBannerController,
                  );
                case 3:
                  return FourStepRegisterPymes(
                    pageController: _pageController,
                    planController: planController,
                    onPressed: () {
                      Map<String, dynamic> newpyme = {
                        'id': pymesProvider.lengthList + 1,
                        'idUser': /* consumerProvider.loggedInConsumer!.id */
                            15,
                        'name': nameController.text,
                        'description': descriptionController.text,
                        'urlPhotoProfile': urlProfileController.text,
                        'urlBannerProfile':
                            urlBannerController.text, // Aquí está el cambio
                        'urlWebSite': urlController.text,
                        'phoneNumber': 'ERROR',
                        'colonia': 'ERROR',
                        'city': 'ERROR',
                        'zipCode': 'ERROR',
                        'latitud': 16.61616001722664,
                        'longitud': -93.09072390802642,
                        'type': categoriaController.text,
                      };

                      String seSubio = pymesProvider.addPyme(newpyme);

                      if (seSubio == 'EXITO') {
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            Future.delayed(
                              const Duration(seconds: 4),
                              () {
                                Navigator.of(context)
                                    .pop(); // Cierra el dialogo
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => const HomeFirst(),
                                  ), // Navega a HomeView
                                );
                              },
                            );
                            return const AlertDialog(
                              title: Text('Mensaje'),
                              content: Text('Se creo con Exito'),
                            );
                          },
                        );
                      } else {
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            Future.delayed(
                              const Duration(seconds: 4),
                              () {
                                Navigator.of(context)
                                    .pop(); // Cierra el dialogo
                              },
                            );
                            return const AlertDialog(
                              title: Text('Error'),
                              content: Text('Hubo un error al crearlo'),
                            );
                          },
                        );
                      }
                    },
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
class Stepper extends StatefulWidget {
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
  State<Stepper> createState() => _StepperState();
}

class _StepperState extends State<Stepper> {
  final List<String> titles = [
    'Datos básicos',
    'Inf. Encargado',
    'Personalizar',
    'Plan'
  ];

  @override
  Widget build(BuildContext context) {
    return widget.isLast
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
                      color: widget.index <= widget.currentIndex
                          ? const Color.fromRGBO(241, 135, 137, 1)
                          : const Color.fromRGBO(95, 95, 95, 1),
                      border: Border.all(
                          color: widget.currentIndex >= widget.index
                              ? const Color.fromRGBO(95, 95, 95, 1)
                              : const Color.fromRGBO(95, 95, 95, 1)),
                    ),
                    child: Center(
                      child: widget.index == widget.currentIndex
                          ? const Icon(Icons.edit,
                              color: Colors
                                  .white) // Icono de edición para el paso actual.
                          : (widget.currentIndex > widget.index
                              ? const Icon(Icons.check,
                                  color: Colors
                                      .white) // Icono de check para los pasos completados.
                              : null), // Nada para los pasos que aún no se han alcanzado.
                    ),
                  ),
                  if (!widget.isLast)
                    Expanded(
                        child: Container(
                      height: 1,
                      color: widget.currentIndex >= widget.index + 1
                          ? const Color.fromRGBO(241, 135, 137, 1)
                          : Colors.black,
                    ))
                ],
              ),
              Text(
                'PASO ${widget.index + 1}',
                style: const TextStyle(
                    color: Color.fromRGBO(95, 95, 95, 1), fontSize: 14),
              ),
              Text(
                titles[widget.index],
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              Container(
                width: SizeResponsize.blockSizeHorizontal(20),
                height: SizeResponsize.blockSizeVertical(3),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: widget.index <= widget.currentIndex
                      ? const Color.fromRGBO(241, 135, 137, 1)
                      : const Color.fromRGBO(95, 95, 95, 1),
                ),
                child: Center(
                  child: Text(
                    widget.currentIndex > widget.index
                        ? 'Completado'
                        : 'En progreso',
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
                        color: widget.index <= widget.currentIndex
                            ? const Color.fromRGBO(241, 135, 137, 1)
                            : const Color.fromRGBO(95, 95, 95, 1),
                        border: Border.all(
                            color: widget.currentIndex >= widget.index
                                ? const Color.fromRGBO(95, 95, 95, 1)
                                : const Color.fromRGBO(95, 95, 95, 1)),
                      ),
                      child: Center(
                        child: widget.index == widget.currentIndex
                            ? const Icon(Icons.edit,
                                color: Colors
                                    .white) // Icono de edición para el paso actual.
                            : (widget.currentIndex > widget.index
                                ? const Icon(Icons.check,
                                    color: Colors
                                        .white) // Icono de check para los pasos completados.
                                : null), // Nada para los pasos que aún no se han alcanzado.
                      ),
                    ),
                    Expanded(
                        child: Container(
                      height: 1,
                      color: widget.currentIndex >= widget.index + 1
                          ? const Color.fromRGBO(241, 135, 137, 1)
                          : const Color.fromRGBO(95, 95, 95, 1),
                    ))
                  ],
                ),
                Text(
                  'PASO ${widget.index + 1}',
                  style: const TextStyle(
                      color: Color.fromRGBO(95, 95, 95, 1), fontSize: 14),
                ),
                Text(
                  titles[widget.index],
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                Container(
                  width: SizeResponsize.blockSizeHorizontal(20),
                  height: SizeResponsize.blockSizeVertical(3),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: widget.index <= widget.currentIndex
                        ? const Color.fromRGBO(241, 135, 137, 1)
                        : const Color.fromRGBO(95, 95, 95, 1),
                  ),
                  child: Center(
                    child: Text(
                      widget.currentIndex > widget.index
                          ? 'Completado'
                          : 'En progreso',
                      style: const TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
          );
  }
}
