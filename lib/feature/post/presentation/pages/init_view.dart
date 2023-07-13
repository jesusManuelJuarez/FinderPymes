import 'package:animate_do/animate_do.dart';
import 'package:finder_pymes/feature/post/presentation/pages/home_cons.dart';
import 'package:finder_pymes/settings/size_responsive.dart';
import 'package:finder_pymes/settings/styles/colors.dart';
import 'package:flutter/material.dart';

class InitView extends StatefulWidget {
  const InitView({super.key});

  @override
  State<InitView> createState() => _InitViewState();
}

class _InitViewState extends State<InitView> {
  @override
  void initState() {
    super.initState();
    _navigateToNextScreen();
  }

  void _navigateToNextScreen() async {
    await Future.delayed(const Duration(seconds: 4));

    // ignore: use_build_context_synchronously
    Navigator.pushReplacement(
      context,
      PageRouteBuilder(
        transitionDuration: const Duration(milliseconds: 500),
        pageBuilder: (context, animation, secondaryAnimation) => FadeTransition(
          opacity: animation,
          child: const HomeFirst(),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: DataColors.colorPinkBackground,
      body: Center(
        child: Column(
          children: [
            SizedBox(
              height: SizeResponsize.blockSizeVertical(20),
            ),
            BounceInDown(
              animate: true,
              duration: const Duration(seconds: 2),
              from: 300,
              child: SizedBox(
                height: SizeResponsize.blockSizeVertical(20),
                child: Image.asset('assets/images/LogoFPY.png'),
              ),
            ),
            SizedBox(
              height: SizeResponsize.blockSizeVertical(50),
            ),
            BounceInUp(
              delay: const Duration(milliseconds: 1250),
              child: SizedBox(
                height: SizeResponsize.blockSizeVertical(6),
                child: Image.asset('assets/images/aez_logo.png'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
