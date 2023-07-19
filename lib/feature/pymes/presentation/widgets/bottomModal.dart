import 'package:finder_pymes/feature/pymes/presentation/widgets/textFormFieldPymes.dart';
import 'package:finder_pymes/settings/size_responsive.dart';
import 'package:flutter/material.dart';

class BottomModal extends StatelessWidget {
  const BottomModal({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30),
            topRight: Radius.circular(30),
          ),
        ),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                color: const Color.fromRGBO(95, 95, 95, 1),
                width: SizeResponsize.safeBlockHorizontal(30),
                height: 4,
              ),
              Row(
                children: [
                  Text(
                    'Datos de contacto',
                    style: TextStyle(
                        fontSize: MediaQuery.of(context).size.width * 0.07,
                        color: const Color.fromRGBO(95, 95, 95, 1),
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Ciudad',
                    style: TextStyle(
                        fontSize: MediaQuery.of(context).size.width * 0.045),
                  ),
                  const TextFormFieldPymes(
                    label: 'Ingresa la ciudad donde te encuantras',
                    borderColor: Color.fromRGBO(242, 142, 144, 1),
                    typeKeyboard: TextInputType.name,
                    obscureText: false,
                  ),
                  Text(
                    'Colonia o barrio',
                    style: TextStyle(
                        fontSize: MediaQuery.of(context).size.width * 0.045),
                  ),
                  const TextFormFieldPymes(
                    label: 'Ingrese su dirección',
                    borderColor: Color.fromRGBO(242, 142, 144, 1),
                    typeKeyboard: TextInputType.name,
                    obscureText: false,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        width: SizeResponsize.safeBlockHorizontal(40),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Número de telefono',
                              style: TextStyle(
                                  fontSize: MediaQuery.of(context).size.width *
                                      0.045),
                            ),
                            const TextFormFieldPymes(
                                label: '(xxx)-xxx-xxxx',
                                borderColor: Colors.black,
                                typeKeyboard: TextInputType.phone,
                                obscureText: false)
                          ],
                        ),
                      ),
                      SizedBox(
                          width: SizeResponsize.safeBlockHorizontal(40),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Código postal',
                                style: TextStyle(
                                    fontSize:
                                        MediaQuery.of(context).size.width *
                                            0.045),
                              ),
                              const TextFormFieldPymes(
                                  label: 'Código Postal',
                                  borderColor: Colors.amber,
                                  typeKeyboard: TextInputType.number,
                                  obscureText: false)
                            ],
                          ))
                    ],
                  ),
                  Text(
                    'Arrastra y coloca tu ubicación en el mapa',
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: MediaQuery.of(context).size.width * 0.03),
                  ),
                  Container(
                    width: SizeResponsize.safeBlockHorizontal(100),
                    height: SizeResponsize.safeBlockVertical(25),
                    color: Colors.grey,
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(
                          const Color.fromRGBO(242, 142, 144, 1)),
                      minimumSize: MaterialStateProperty.all<Size>(Size(
                          SizeResponsize.blockSizeHorizontal(100),
                          50)), // Tamaño mínimo
                    ),
                    onPressed: () {},
                    child: const Text(
                      'Atrás',
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                ],
              )
            ],
          ),
        ));
  }
}
