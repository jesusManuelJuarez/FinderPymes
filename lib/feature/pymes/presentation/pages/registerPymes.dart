import 'package:finder_pymes/feature/pymes/presentation/pages/datosEmpresa.dart';
import 'package:finder_pymes/feature/pymes/presentation/pages/stepper_state.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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
        child: SafeArea(
            child: FractionallySizedBox(
          alignment: Alignment.bottomCenter,
          heightFactor: 0.45,
          child: Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(30)),
            child: Column(
              children: [
                Text(
                  title,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    color: Color.fromRGBO(95, 95, 95, 1),
                    fontWeight: FontWeight.bold,
                    fontSize: 30,
                  ),
                ),
                const SizedBox(height: 15),
                Text(
                  description,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    color: Color.fromRGBO(241, 135, 137, 1),
                    fontSize: 16,
                  ),
                ),
                const SizedBox(height: 15),
                ElevatedButton(
                  onPressed: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ChangeNotifierProvider(
                        create: (context) => StepperState(),
                        child: DatosEmpresaPage(),
                      ),
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    minimumSize: const Size.fromHeight(50),
                    backgroundColor: const Color.fromRGBO(4, 104, 252, 1),
                  ),
                  child: const Text(
                    "Comenzar registro",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                      fontSize: 16,
                    ),
                  ),
                )
              ],
            ),
          ),
        )),
      ),
    );
  }
}
