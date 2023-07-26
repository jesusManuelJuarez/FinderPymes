// ignore_for_file: file_names, unused_import

import 'package:finder_pymes/feature/pymes/presentation/pages/datos_empresa.dart';
import 'package:finder_pymes/feature/pymes/presentation/providers/stepper_state.dart';
import 'package:finder_pymes/settings/size_responsive.dart';
import 'package:finder_pymes/settings/styles/colors.dart';
import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import '../providers/image_picker_provider.dart';

class RegisterPymesPage extends StatelessWidget {
  const RegisterPymesPage({super.key});

  @override
  Widget build(BuildContext context) {
    String title = "Potencia tu empresa con un solo click.";
    String description =
        "¡Impulsa tu negocio con nosotros! Mejora tu visibilidad y conecta con nuevos clientes con el Plan Premium. Únete hoy y comienza a crecer en nuestra comunidad.";
    return Scaffold(
      body: Container(
        width: SizeResponsize.sizeScreenWidth,
        height: SizeResponsize.sizeScreenHeigth,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/Rectangle 18.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: SizeResponsize.textSize(25),
            ),
            child: Container(
              height: SizeResponsize.blockSizeVertical(50),
              decoration: BoxDecoration(
                color: const Color.fromARGB(214, 255, 255, 255),
                borderRadius: BorderRadius.circular(30),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    title,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: const Color.fromRGBO(95, 95, 95, 1),
                      fontWeight: FontWeight.bold,
                      fontSize: SizeResponsize.textSize(23),
                    ),
                  ),
                  Text(
                    description,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: DataColors.colorPinkBackground,
                      fontSize: SizeResponsize.textSize(15),
                    ),
                  ),
                  SizedBox(
                    height: SizeResponsize.textSize(40),
                    width: SizeResponsize.textSize(250),
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => DatosEmpresaPage(),
                          ),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: DataColors.colorBlueBottom,
                      ),
                      child: Text(
                        "Comenzar registro",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: SizeResponsize.textSize(20),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
