import 'package:finder_pymes/feature/post/presentation/widgets/bottom_navbar.dart';
import 'package:flutter/material.dart';

class ProfileConsumer extends StatelessWidget {
  const ProfileConsumer({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: customBottomNavigationBar(5, context),
    );
  }
}