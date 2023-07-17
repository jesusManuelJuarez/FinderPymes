// ignore_for_file: file_names

import 'package:finder_pymes/feature/pymes/presentation/pages/datosEmpresa.dart';
import 'package:finder_pymes/feature/pymes/presentation/pages/stepper_state.dart';
import 'package:finder_pymes/settings/size_responsive.dart';
import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import 'image_picker_provider.dart';

class RegisterPymesPage extends StatelessWidget {
  const RegisterPymesPage({super.key});

  @override
  Widget build(BuildContext context) {
    String title = "Potencia tu empresa con un solo click.";
    String description =
        "¡Impulsa tu negocio con nosotros! Mejora tu visibilidad y conecta con nuevos clientes con el Plan Premium. Únete hoy y comienza a crecer en nuestra comunidad.";
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(20),
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage("assets/images/Rectangle 18.png"),
              fit: BoxFit.cover),
        ),
        child: Center(
          child: Container(
            padding: const EdgeInsets.all(30),
            height: SizeResponsize.blockSizeVertical(60),
            width: SizeResponsize.sizeScreenWidth,
            decoration: BoxDecoration(
                color: const Color.fromARGB(214, 255, 255, 255),
                borderRadius: BorderRadius.circular(30)),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  title,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: const Color.fromRGBO(95, 95, 95, 1),
                    fontWeight: FontWeight.bold,
                    fontSize: MediaQuery.of(context).size.width * 0.08,
                  ),
                ),
                Text(
                  description,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: const Color.fromRGBO(241, 135, 137, 1),
                    fontSize: MediaQuery.of(context).size.width * 0.05,
                  ),
                ),
                //SizedBox(height: SizeResponsize.blockSizeHorizontal(2)),
                ElevatedButton(
                  onPressed: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => MultiProvider(
                        providers: [
                          ChangeNotifierProvider(
                            create: (context) => StepperState(),
                          ),
                          ChangeNotifierProvider(
                            create: (context) => ImagePickerProvider(),
                          ),
                        ],
                        child: DatosEmpresaPage(),
                      ),
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    minimumSize: const Size.fromHeight(60),
                    backgroundColor: const Color.fromRGBO(4, 104, 252, 1),
                  ),
                  child: Text(
                    "Comenzar registro",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: MediaQuery.of(context).size.width * 0.05,
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
