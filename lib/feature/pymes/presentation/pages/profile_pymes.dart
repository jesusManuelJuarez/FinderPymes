import 'package:finder_pymes/feature/post/presentation/widgets/bottom_navbar.dart';
import 'package:finder_pymes/feature/pymes/presentation/widgets/carousel_pymes.dart';
import 'package:flutter/material.dart';

class ProfilePymesPage extends StatelessWidget {
  const ProfilePymesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const SafeArea(
        child: Center(
          child: ImageCarousel(),
        ),
      ),
      bottomNavigationBar: customBottomNavigationBar(2, context),
    );
  }
}
