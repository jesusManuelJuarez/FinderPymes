import 'package:finder_pymes/feature/pymes/presentation/pages/datosEmpresa.dart';
import 'package:finder_pymes/feature/pymes/presentation/pages/registerPymes.dart';
import 'package:provider/provider.dart';
import 'package:finder_pymes/feature/pymes/presentation/pages/stepper_state.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'FynderPymes',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ChangeNotifierProvider(
        create: (context) => StepperState(),
        child: DatosEmpresaPage(),
      ), //RegisterPymesPage(),
    );
  }
}
