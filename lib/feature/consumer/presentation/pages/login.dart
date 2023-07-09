import 'package:finder_pymes/feature/consumer/presentation/widgets/bottom_customer.dart';
import 'package:finder_pymes/feature/consumer/presentation/widgets/textformfield_customer.dart';
import 'package:finder_pymes/settings/size_responsive.dart';
import 'package:finder_pymes/settings/styles/colors.dart';
import 'package:flutter/material.dart';

class LoginConsumer extends StatelessWidget {
  const LoginConsumer({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: DataColors.colorPinkBackground,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: DataColors.colorTransparent,
      ),
      body: Column(
        children: [
          Expanded(
            flex: 3,
            child: Padding(
              padding: const EdgeInsets.only(bottom: 100.0),
              child: Image.asset('assets/images/logo_fpy.png'),
            ),
          ),
          Expanded(
            flex: 5,
            child: Container(
              width: SizeResponsize.sizeScreenWidth,
              decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(50),
                    topRight: Radius.circular(50),
                  ),
                  color: DataColors.colorWhite),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  const SizedBox(
                    child: Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(right: 140.0),
                          child: Text(
                            'Iniciar Sesión',
                            textAlign: TextAlign.start,
                            style: TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(right: 100.0),
                          child: Text(
                            'Inicio de sesion para consumidores',
                            style: TextStyle(fontWeight: FontWeight.w400),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    width: SizeResponsize.safeBlockHorizontal(82),
                    child: const Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(right: 284.0, bottom: 10),
                          child: Text(
                            'Email',
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                        CustomerTextFormField(
                          label: 'name.lastname@example.com',
                          iconSuffixIcon: Icon(Icons.email),
                          borderColor: DataColors.colorGrey,
                          typeKeyboard: TextInputType.emailAddress,
                          obscureText: false,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    width: SizeResponsize.safeBlockHorizontal(82),
                    child: const Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(right: 244.0, bottom: 10),
                          child: Text(
                            'Contraseña',
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                        CustomerTextFormField(
                          label: 'Contraseña',
                          iconSuffixIcon: Icon(Icons.password),
                          borderColor: DataColors.colorGrey,
                          typeKeyboard: TextInputType.text,
                          obscureText: true,
                        ),
                      ],
                    ),
                  ),
                  CustomerElevateBottom(
                    label: 'Iniciar Sesión',
                    onPressed: () {},
                    backgroundColor: DataColors.colorBlueBottom,
                    textColor: DataColors.colorWhite,
                    sizeHorizontal: 25.8,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 68.0),
                    child: RichText(
                      text: TextSpan(
                        children: [
                          const TextSpan(
                            text: '¿Aún no tienes cuenta? ',
                            style: TextStyle(
                              color: DataColors.colorGreyText,
                              fontSize: 15,
                            ),
                          ),
                          WidgetSpan(
                            child: GestureDetector(
                              onTap: () {},
                              child: const Text(
                                '¡Regístrate ya!',
                                style: TextStyle(
                                  color: DataColors.colorBlueText,
                                  fontSize: 15,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
