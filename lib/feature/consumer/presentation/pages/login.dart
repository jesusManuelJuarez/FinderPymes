import 'package:finder_pymes/feature/consumer/presentation/pages/profile.dart';
import 'package:finder_pymes/feature/consumer/presentation/pages/register.dart';
import 'package:finder_pymes/feature/consumer/presentation/provider/consumer_provider.dart';
import 'package:finder_pymes/feature/consumer/presentation/provider/data_consumer_provider.dart';
import 'package:finder_pymes/feature/consumer/presentation/widgets/bottom_customer.dart';
import 'package:finder_pymes/feature/consumer/presentation/widgets/textformfield_customer.dart';
import 'package:finder_pymes/settings/size_responsive.dart';
import 'package:finder_pymes/settings/styles/colors.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoginConsumer extends StatelessWidget {
  const LoginConsumer({super.key});

  @override
  Widget build(BuildContext context) {
    ConsumerProvider consumerProvider = Provider.of<ConsumerProvider>(context);
    double sizeTextTittle = SizeResponsize.textSize(20);
    double sizeTextNormal = SizeResponsize.textSize(10);
    final TextEditingController emailController = TextEditingController();
    final TextEditingController passwordController = TextEditingController();
    final keyFormLogin = GlobalKey<FormState>();
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
              height: SizeResponsize.blockSizeVertical(35),
              child: Image.asset('assets/images/logo_fpy.png'),
            ),
            Container(
              width: SizeResponsize.sizeScreenWidth,
              height: SizeResponsize.blockSizeVertical(55),
              decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(50),
                    topRight: Radius.circular(50),
                  ),
                  color: DataColors.colorWhite),
              child: Form(
                key: keyFormLogin,
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
                              'Iniciar Sesión',
                              style: TextStyle(
                                fontSize: sizeTextTittle,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              'Inicio de sesion para usuarios',
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
                              'Email',
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
                              String pattern =
                                  r'^[\w-]+(\.[\w-]+)*@[a-zA-Z0-9-]+(\.[a-zA-Z0-9-]+)*(\.[a-zA-Z]{2,})$';
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
                              String pattern =
                                  r'^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)[a-zA-Z\d]{6,}$';
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
                      label: 'Iniciar Sesión',
                      onPressed: () async {
                        final pymesProvider =
                            Provider.of<PymesProvider>(context, listen: false);
                        if (keyFormLogin.currentState!.validate()) {
                          try {
                            await consumerProvider.loginConsumer(
                              emailController.text,
                              passwordController.text,
                            );

                            pymesProvider
                                .checkIfTheConsumerHasAnPyme(consumerProvider);
                            // ignore: use_build_context_synchronously
                            showDialogWelcome(context, consumerProvider);
                          } catch (e) {
                            showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  title: const Text('Error'),
                                  content: Text(
                                      'Ocurrió un error durante el inicio de sesión: $e'),
                                );
                              },
                            );
                          }
                        }
                      },
                      backgroundColor: DataColors.colorBlueBottom,
                      textColor: DataColors.colorWhite,
                      sizeHorizontal: SizeResponsize.textSize(22),
                    ),
                    RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: '¿Aún no tienes cuenta? ',
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
                                    builder: (context) =>
                                        const RegisterConsumer(),
                                  ),
                                );
                              },
                              child: Text(
                                '¡Regístrate ya!',
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

  Future<dynamic> showDialogWelcome(
      BuildContext context, ConsumerProvider consumerProvider) {
    return showDialog(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {
        Future.delayed(const Duration(seconds: 3), () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const ProfileConsumer(),
            ),
          );
        });
        return AlertDialog(
          title: const Text(
            'Bienvenido',
            style: TextStyle(
              color: Colors.green,
              fontWeight: FontWeight.bold,
              fontSize: 24,
            ),
          ),
          content: Text(
            consumerProvider.loggedInConsumer!.name,
            style: const TextStyle(
              fontSize: 18,
            ),
          ),
        );
      },
    );
  }
}
