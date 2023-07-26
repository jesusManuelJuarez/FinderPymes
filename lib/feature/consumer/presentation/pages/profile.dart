import 'package:finder_pymes/feature/consumer/presentation/provider/consumer_provider.dart';
import 'package:finder_pymes/feature/consumer/presentation/widgets/bottom_customer_profile.dart';
import 'package:finder_pymes/feature/post/presentation/widgets/bottom_navbar.dart';
import 'package:finder_pymes/restart_app.dart';
import 'package:finder_pymes/settings/size_responsive.dart';
import 'package:finder_pymes/settings/styles/colors.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProfileConsumer extends StatelessWidget {
  const ProfileConsumer({super.key});

  @override
  Widget build(BuildContext context) {
    ConsumerProvider consumerProvider = Provider.of<ConsumerProvider>(context);
    return Scaffold(
      backgroundColor: DataColors.colorWhite,
      body: SingleChildScrollView(
        child: SizedBox(
          child: Column(
            children: [
              photoProfile(consumerProvider),
              nameInfo(consumerProvider),
              const Divider(
                color: Color.fromARGB(32, 0, 0, 0),
                height: 20,
                thickness: 2,
                indent: 5,
                endIndent: 5,
              ),
              ButtomCustomProfile(
                label: 'Información Personal',
                onTap: () {
                  showUserInfoDialog(context, consumerProvider);
                },
              ),
              ButtomCustomProfile(
                label: 'Favoritos',
                onTap: () {},
              ),
              ButtomCustomProfile(
                label: 'Cambiar Contraseña',
                onTap: () {},
              ),
              ButtomCustomProfile(
                label: 'Ver Negocio',
                onTap: () {},
              ),
              ButtomCustomProfile(
                label: 'Cerrar Sesión',
                onTap: () {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: const Row(
                          children: [
                            Icon(Icons.warning, color: Colors.orange),
                            SizedBox(width: 10),
                            Text('Cerrar Sesión',
                                style: TextStyle(color: Colors.red)),
                          ],
                        ),
                        content: const Text(
                            '¿Estás seguro de que quieres cerrar sesión?',
                            style: TextStyle(color: Colors.black)),
                        actions: <Widget>[
                          TextButton(
                            child: const Text('Cancelar',
                                style: TextStyle(color: Colors.blue)),
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                          ),
                          TextButton(
                            child: const Text('Confirmar',
                                style: TextStyle(color: Colors.red)),
                            onPressed: () {
                              RestartWidget.restartApp(context);
                            },
                          ),
                        ],
                      );
                    },
                  );
                },
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: customBottomNavigationBar(5, context),
    );
  }

  void showUserInfoDialog(
      BuildContext context, ConsumerProvider consumerProvider) {
    showDialog(
      barrierColor: DataColors.colorPinkSuave,
      context: context,
      builder: (BuildContext context) {
        return Theme(
          data: Theme.of(context)
              .copyWith(dialogBackgroundColor: DataColors.colorWhite),
          child: AlertDialog(
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Image.network(
                  consumerProvider.loggedInConsumer!.urlPhoto,
                  width: 250,
                  height: 250,
                  errorBuilder: (context, error, stackTrace) {
                    return Image.asset('assets/images/profile_const.jpg',
                        width: 100, height: 100);
                  },
                ),
                const SizedBox(height: 20),
                Text(
                  consumerProvider.loggedInConsumer!.name,
                  style: const TextStyle(
                      fontSize: 20, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 10),
                Text(
                  consumerProvider.loggedInConsumer!.email,
                  style: const TextStyle(fontSize: 16),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  SizedBox nameInfo(ConsumerProvider consumerProvider) {
    String name = consumerProvider.loggedInConsumer!.name;
    List<String> words = name.split(' ');
    return SizedBox(
      child: Column(
        children: [
          Text(
            words[0],
            style: const TextStyle(
              fontSize: 40,
            ),
          ),
          words.length > 1
              ? Text(
                  words.sublist(1).join(' '),
                  style: const TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 30,
                    color: DataColors.colorGreyText,
                    fontStyle: FontStyle.italic,
                  ),
                )
              : const Placeholder()
        ],
      ),
    );
  }

  Container photoProfile(ConsumerProvider consumerProvider) {
    return Container(
      width: SizeResponsize.sizeScreenWidth,
      height: SizeResponsize.blockSizeVertical(35),
      color: DataColors.colorPinkBackground,
      child: Stack(
        children: [
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              width: SizeResponsize.sizeScreenWidth,
              height: SizeResponsize.safeBlockVertical(15),
              decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(50),
                    topRight: Radius.circular(50),
                  ),
                  color: DataColors.colorWhite),
            ),
          ),
          Positioned(
            left: SizeResponsize.safeBlockHorizontal(25),
            top: SizeResponsize.blockSizeVertical(9),
            child: CircleAvatar(
              radius: 95,
              child: ClipOval(
                child: FadeInImage.assetNetwork(
                  placeholder: 'assets/images/profile_const.jpg',
                  image: consumerProvider.loggedInConsumer!.urlPhoto,
                  imageErrorBuilder: (context, error, stackTrace) {
                    return Image.asset('assets/images/profile_const.jpg');
                  },
                  fit: BoxFit.cover,
                  width: 190.0,
                  height: 190.0,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
