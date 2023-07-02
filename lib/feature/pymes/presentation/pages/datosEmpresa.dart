import 'package:flutter/material.dart';

class DatosEmpresaPage extends StatefulWidget {
  const DatosEmpresaPage({Key? key}) : super(key: key);

  @override
  State<DatosEmpresaPage> createState() => DatosEmpresaPageState();
}

class DatosEmpresaPageState extends State<DatosEmpresaPage> {
  int _activeStepIndex = 0;
  List<Step> stepList() => [
        Step(
            state: StepState.editing,
            isActive: _activeStepIndex >= 0,
            title: const Text('Example 1'),
            content: const Center(
              child: Text('Example1'),
            )),
        Step(
            state: StepState.editing,
            isActive: _activeStepIndex >= 0,
            title: const Text('Address'),
            content: const Center(
              child: Text('Address'),
            )),
        Step(
            state: StepState.editing,
            isActive: _activeStepIndex >= 0,
            title: const Text('Confirm'),
            content: const Center(
              child: Text('Comfirm'),
            )),
      ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Registro de Pymes'),
        centerTitle: true,
        backgroundColor: Colors
            .transparent, // Aquí hacemos transparente el fondo de la AppBar
        elevation: 0, // Quitamos la sombra que puede generar la AppBar
        leading: const BackButton(
            color: Color.fromRGBO(
                241, 135, 137, 1)), // Cambiamos el color del botón de retroceso
      ),
      body: Stepper(
        type: StepperType.horizontal,
        currentStep: _activeStepIndex,
        steps: stepList(),
        onStepContinue: () {
          if (_activeStepIndex < (stepList().length - 1)) {
            _activeStepIndex += 1;
          }
          setState(() {});
        },
        onStepCancel: () {
          if (_activeStepIndex == 0) {
            return;
          }
          _activeStepIndex -= 1;
          setState(() {});
        },
      ),
    );
  }
}
