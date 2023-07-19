import 'package:finder_pymes/feature/pymes/presentation/widgets/bottomModal.dart';
import 'package:flutter/material.dart';

import '../../../../settings/size_responsive.dart';

class Stepper1 extends StatelessWidget {
  const Stepper1({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
            height: SizeResponsize.safeBlockVertical(65.0),
            width: double.infinity,
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
                      showModalBottomSheet(
                        context: context,
                        isScrollControlled: true,
                        shape: const RoundedRectangleBorder(
                          borderRadius:
                              BorderRadius.vertical(top: Radius.circular(30)),
                        ),
                        builder: (BuildContext context) =>
                            const FractionallySizedBox(
                          heightFactor: 0.80,
                          child: BottomModal(),
                        ),
                      );
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
                          style: TextStyle(
                              color: Color.fromRGBO(242, 142, 144, 1)),
                        ),
                        Icon(Icons.chevron_right,
                            color: Color.fromRGBO(
                                242, 142, 144, 1)), // icono Chevron-Right
                      ],
                    ),
                  ),
                ),
              ],
            )),
      ],
    );
  }
}
