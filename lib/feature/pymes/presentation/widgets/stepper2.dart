import 'package:flutter/material.dart';

class Stepper2 extends StatelessWidget {
  const Stepper2({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
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
            hintStyle: const TextStyle(color: Color.fromRGBO(95, 95, 95, 1)),
            errorStyle: const TextStyle(color: Colors.redAccent),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(
                  color: Color.fromRGBO(
                      242, 142, 144, 1)), // Color del borde en estado normal.
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(
                  color: Color.fromRGBO(
                      242, 142, 144, 1)), // Color del borde en estado enfocado.
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
            hintStyle: const TextStyle(color: Color.fromRGBO(95, 95, 95, 1)),
            errorStyle: const TextStyle(color: Colors.redAccent),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(
                  color: Color.fromRGBO(
                      242, 142, 144, 1)), // Color del borde en estado normal.
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(
                  color: Color.fromRGBO(
                      242, 142, 144, 1)), // Color del borde en estado enfocado.
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
            hintStyle: const TextStyle(color: Color.fromRGBO(95, 95, 95, 1)),
            errorStyle: const TextStyle(color: Colors.redAccent),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(
                  color: Color.fromRGBO(
                      242, 142, 144, 1)), // Color del borde en estado normal.
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(
                  color: Color.fromRGBO(
                      242, 142, 144, 1)), // Color del borde en estado enfocado.
            ),
          ),
        ),
      ],
    );
  }
}
