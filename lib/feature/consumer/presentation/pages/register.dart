import 'package:finder_pymes/feature/consumer/presentation/pages/login.dart';
import 'package:finder_pymes/feature/consumer/presentation/widgets/bottom_customer.dart';
import 'package:finder_pymes/feature/consumer/presentation/widgets/textformfield_customer.dart';
import 'package:finder_pymes/settings/size_responsive.dart';
import 'package:finder_pymes/settings/styles/colors.dart';
import 'package:flutter/material.dart';

class RegisterConsumer extends StatelessWidget {
  const RegisterConsumer({super.key});

  @override
  Widget build(BuildContext context) {
    double sizeTextTittle = SizeResponsize.textSize(7.6388893);
    double sizeTextNormal = SizeResponsize.textSize(3.8194447);
    return Scaffold(
      backgroundColor: DataColors.colorPinkBackground,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: DataColors.colorTransparent,
      ),
      body: Column(
        children: [
          Expanded(
            flex: 2,
            child: Padding(
              padding:
                  EdgeInsets.only(bottom: SizeResponsize.textSize(2.546296444)),
              child: Image.asset('assets/images/logo_fpy.png'),
            ),
          ),
          Expanded(
            flex: 6,
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
                  SizedBox(
                    child: Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(
                              right: SizeResponsize.textSize(24.44444586)),
                          child: Text(
                            'Crear una cuenta',
                            textAlign: TextAlign.start,
                            style: TextStyle(
                              fontSize: sizeTextTittle,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                              right: SizeResponsize.textSize(19.86111226)),
                          child: Text(
                            'Crear una cuenta para consumidores',
                            style: TextStyle(
                                fontWeight: FontWeight.w400,
                                fontSize: sizeTextNormal),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    width: SizeResponsize.safeBlockHorizontal(82),
                    child: Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(
                              right: SizeResponsize.textSize(68.24074469),
                              bottom: SizeResponsize.textSize(2.546296444)),
                          child: Text(
                            'Nombre',
                            style: TextStyle(
                              fontSize: sizeTextNormal,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                        const CustomerTextFormField(
                          label: 'Juan Lopez Perez',
                          iconSuffixIcon: Icon(Icons.person),
                          borderColor: DataColors.colorGrey,
                          typeKeyboard: TextInputType.emailAddress,
                          obscureText: false,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    width: SizeResponsize.safeBlockHorizontal(82),
                    child: Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(
                              right: SizeResponsize.textSize(70.27778184),
                              bottom: SizeResponsize.textSize(2.546296444)),
                          child: Text(
                            'Correo',
                            style: TextStyle(
                              fontSize: sizeTextNormal,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                        const CustomerTextFormField(
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
                    child: Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(
                              right: SizeResponsize.textSize(62.12963323),
                              bottom: SizeResponsize.textSize(2.546296444)),
                          child: Text(
                            'Contraseña',
                            style: TextStyle(
                              fontSize: sizeTextNormal,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                        const CustomerTextFormField(
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
                    label: 'Crear Cuenta',
                    onPressed: () {},
                    backgroundColor: DataColors.colorBlueBottom,
                    textColor: DataColors.colorWhite,
                    sizeHorizontal: SizeResponsize.textSize(6.671296682),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                        right: SizeResponsize.textSize(25.46296444)),
                    child: RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: '¿Ya tienes cuenta? ',
                            style: TextStyle(
                              color: DataColors.colorGreyText,
                              fontSize: sizeTextNormal,
                            ),
                          ),
                          WidgetSpan(
                            child: GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => const LoginConsumer(),
                                  ),
                                );
                              },
                              child: Text(
                                '¡Inicia Sesión!',
                                style: TextStyle(
                                  color: DataColors.colorBlueText,
                                  fontSize: sizeTextNormal,
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
