import 'package:finder_pymes/feature/consumer/presentation/pages/first_view.dart';
import 'package:finder_pymes/settings/size_responsive.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    SizeResponsize(context);
    return MaterialApp(
      title: 'FinderPymes',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home:  const FirstViewPage()  //RegisterPymesPage(),
    );
  }
}
