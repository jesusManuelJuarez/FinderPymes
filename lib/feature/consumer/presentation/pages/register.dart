import 'package:finder_pymes/feature/consumer/presentation/pages/login.dart';
import 'package:finder_pymes/feature/consumer/presentation/widgets/bottom_customer.dart';
import 'package:finder_pymes/feature/consumer/presentation/widgets/textformfield_customer.dart';
import 'package:finder_pymes/feature/post/presentation/pages/home_cons.dart';
import 'package:finder_pymes/settings/size_responsive.dart';
import 'package:finder_pymes/settings/styles/colors.dart';
import 'package:flutter/material.dart';

class RegisterConsumer extends StatelessWidget {
  const RegisterConsumer({super.key});

  @override
  Widget build(BuildContext context) {
    double sizeTextTittle = SizeResponsize.textSize(7.6388893);
    double sizeTextNormal = SizeResponsize.textSize(3.8194447);
    final TextEditingController nameController = TextEditingController();
    final TextEditingController emailController = TextEditingController();
    final TextEditingController passwordController = TextEditingController();
    final keyFormRegister = GlobalKey<FormState>();
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: DataColors.colorPinkBackground,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: DataColors.colorTransparent,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: SizeResponsize.blockSizeVertical(25),
              child: Image.asset('assets/images/logo_fpy.png'),
            ),
            Container(
              width: SizeResponsize.sizeScreenWidth,
              height: SizeResponsize.blockSizeVertical(65),
              decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(50),
                    topRight: Radius.circular(50),
                  ),
                  color: DataColors.colorWhite),
              child: Form(
                key: keyFormRegister,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    SizedBox(
                      width: SizeResponsize.safeBlockHorizontal(82),
                      child: Column(
                        children: [
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              'Crear una cuenta',
                              style: TextStyle(
                                fontSize: sizeTextTittle,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              '¡Crea una nueva cuenta de usuario!',
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
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              'Nombre Completo',
                              style: TextStyle(
                                fontSize: sizeTextNormal,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                          CustomerTextFormField(
                            label: 'Juan Lopez Perez',
                            controller: nameController,
                            validator: (value) {
                              String pattern = r'^[a-zA-ZÁÉÍÓÚáéíóúüÜÑñ ]+$';
                              RegExp regex = RegExp(pattern);
                              if (value == null || value.isEmpty) {
                                return 'Escriba un nombre correcto';
                              } else if (!regex.hasMatch(value)) {
                                return 'Escriba un nombre correcto';
                              }
                              return null;
                            },
                            iconSuffixIcon: const Icon(Icons.person),
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
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              'Correo',
                              style: TextStyle(
                                fontSize: sizeTextNormal,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                          CustomerTextFormField(
                            label: 'name.lastname@example.com',
                            controller: emailController,
                            validator: (value) {
                              String pattern = r'^[\w-]+(\.[\w-]+)*@[a-zA-Z0-9-]+(\.[a-zA-Z0-9-]+)*(\.[a-zA-Z]{2,})$';
                              RegExp regex = RegExp(pattern);
                              if (value == null || value.isEmpty) {
                                return 'Escriba un correo correcto';
                              } else if (!regex.hasMatch(value)) {
                                return 'Escriba un correo correcto';
                              }
                              return null;
                            },
                            iconSuffixIcon: const Icon(Icons.email),
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
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              'Contraseña',
                              style: TextStyle(
                                fontSize: sizeTextNormal,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                          CustomerTextFormField(
                            label: 'Contraseña',
                            controller: passwordController,
                            validator: (value) {
                              String pattern = r'^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)[a-zA-Z\d]{6,}$';
                              RegExp regex = RegExp(pattern);
                              if (value == null || value.isEmpty) {
                                return 'Escriba un contraseña correcta';
                              } else if (!regex.hasMatch(value)) {
                                return 'Escriba un contraseña correcta';
                              }
                              return null;
                            },
                            iconSuffixIcon: const Icon(Icons.password),
                            borderColor: DataColors.colorGrey,
                            typeKeyboard: TextInputType.text,
                            obscureText: true,
                          ),
                        ],
                      ),
                    ),
                    CustomerElevateBottom(
                      label: 'Crear Cuenta',
                      onPressed: () {
                        if (keyFormRegister.currentState!.validate()) {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const HomeFirst(),
                            ),
                          );
                        }
                      },
                      backgroundColor: DataColors.colorBlueBottom,
                      textColor: DataColors.colorWhite,
                      sizeHorizontal: SizeResponsize.textSize(6.671296682),
                    ),
                    RichText(
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
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
