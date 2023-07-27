import 'package:finder_pymes/settings/size_responsive.dart';
import 'package:flutter/material.dart';

class FourStepRegisterPymes extends StatelessWidget {
  final PageController pageController;
  final TextEditingController planController;
  final void Function()? onPressed;
  const FourStepRegisterPymes(
      {super.key,
      required this.pageController,
      required this.planController,
      required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4),
      child: Column(
        children: [
          Text(
            'Conoce nuestro planes',
            style: TextStyle(
                fontSize: MediaQuery.of(context).size.width * 0.06,
                color: const Color.fromRGBO(95, 95, 95, 1)),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10),
            child: Container(
              height: SizeResponsize.blockSizeHorizontal(40),
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
                ],
              ),
              child: Column(
                children: [
                  Container(
                    padding: EdgeInsets.only(
                      left: SizeResponsize.safeBlockHorizontal(50),
                    ),
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
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10),
            child: Container(
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
                ],
              ),
              child: Row(
                children: [
                  SizedBox(
                    width: SizeResponsize.safeBlockHorizontal(50),
                    height: SizeResponsize.safeBlockVertical(100),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '12 MESES',
                          style: TextStyle(
                            fontSize: MediaQuery.of(context).size.width * 0.03,
                          ),
                        ),
                        RichText(
                          text: TextSpan(
                            children: [
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
                                  fontWeight: FontWeight.bold,
                                ),
                              )
                            ],
                          ),
                        ),
                        RichText(
                          text: TextSpan(
                            children: [
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
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              TextSpan(
                                text: '12 ',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize:
                                      MediaQuery.of(context).size.width * 0.03,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              TextSpan(
                                text: 'meses',
                                style: TextStyle(
                                  color: const Color.fromRGBO(95, 95, 95, 1),
                                  fontSize:
                                      MediaQuery.of(context).size.width * 0.03,
                                  fontWeight: FontWeight.bold,
                                ),
                              )
                            ],
                          ),
                        ),
                        Text(
                          ' Puede aplicarse IVA, o impuesto locales',
                          style: TextStyle(
                            fontSize: MediaQuery.of(context).size.width * 0.02,
                            color: const Color.fromRGBO(
                              95,
                              95,
                              95,
                              1,
                            ),
                          ),
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
                            const Color.fromRGBO(
                              242,
                              142,
                              144,
                              1,
                            ),
                          ),
                        ),
                        onPressed: () {
                          planController.text = '3';
                        },
                        child: const Text('Suscribirse'),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10),
            child: Container(
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
                ],
              ),
              child: Row(
                children: [
                  SizedBox(
                    width: SizeResponsize.safeBlockHorizontal(50),
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
                          text: TextSpan(
                            children: [
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
                                        MediaQuery.of(context).size.width *
                                            0.03,
                                    fontWeight: FontWeight.bold),
                              )
                            ],
                          ),
                        ),
                        RichText(
                          text: TextSpan(
                            children: [
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
                                      color:
                                          const Color.fromRGBO(95, 95, 95, 1),
                                      fontSize:
                                          MediaQuery.of(context).size.width *
                                              0.03,
                                      fontWeight: FontWeight.bold)),
                              TextSpan(
                                  text: 'mes ',
                                  style: TextStyle(
                                      color:
                                          const Color.fromRGBO(95, 95, 95, 1),
                                      fontSize:
                                          MediaQuery.of(context).size.width *
                                              0.03,
                                      fontWeight: FontWeight.bold)),
                            ],
                          ),
                        ),
                        Text(
                          ' Puede aplicarse IVA, o impuesto locales',
                          style: TextStyle(
                            fontSize: MediaQuery.of(context).size.width * 0.02,
                            color: const Color.fromRGBO(95, 95, 95, 1),
                          ),
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
                        onPressed: () {
                          planController.text = '2';
                        },
                        child: const Text('Suscribirse'),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10),
            child: Container(
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
                ],
              ),
              child: Row(
                children: [
                  SizedBox(
                    width: SizeResponsize.safeBlockHorizontal(50),
                    height: SizeResponsize.safeBlockVertical(100),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'GRATUITO',
                          style: TextStyle(
                            fontSize: MediaQuery.of(context).size.width * 0.03,
                          ),
                        ),
                        RichText(
                          text: TextSpan(
                            children: [
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
                                        MediaQuery.of(context).size.width *
                                            0.03,
                                    fontWeight: FontWeight.bold),
                              )
                            ],
                          ),
                        ),
                        RichText(
                          text: TextSpan(
                            children: [
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
                                      color:
                                          const Color.fromRGBO(95, 95, 95, 1),
                                      fontSize:
                                          MediaQuery.of(context).size.width *
                                              0.03,
                                      fontWeight: FontWeight.bold)),
                            ],
                          ),
                        ),
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
                        onPressed: () {
                          planController.text = '1';
                        },
                        child: const Text('Suscribirse'),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10),
            child: ElevatedButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(
                    const Color.fromRGBO(95, 95, 95, 1)),
                minimumSize: MaterialStateProperty.all<Size>(
                  Size(SizeResponsize.blockSizeHorizontal(100), 50),
                ), // Tamaño mínimo
              ),
              onPressed: onPressed,
              child: const Text(
                'Registrarse',
                style: TextStyle(fontSize: 20),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
