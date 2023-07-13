import 'package:finder_pymes/feature/consumer/presentation/widgets/bottom_customer.dart';
import 'package:finder_pymes/feature/post/presentation/widgets/bottom_navbar.dart';
import 'package:finder_pymes/settings/styles/colors.dart';
import 'package:flutter/material.dart';

class ProfileConsumer extends StatelessWidget {
  const ProfileConsumer({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: CustomerElevateBottom(
              label: 'Iniciar Sesión',
              onPressed: () {},
              backgroundColor: DataColors.colorBlueBottom,
              textColor: DataColors.colorWhite,
              sizeHorizontal: 10),
        ),
      ),
      bottomNavigationBar: customBottomNavigationBar(5, context),
    );
  }
}
