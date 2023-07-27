import 'package:finder_pymes/feature/consumer/presentation/provider/consumer_provider.dart';
import 'package:finder_pymes/feature/post/presentation/widgets/bottom_navbar.dart';
import 'package:finder_pymes/feature/sources/presentation/widgets/notification_listile.dart';
import 'package:finder_pymes/settings/size_responsive.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class NotificationsPost extends StatelessWidget {
  const NotificationsPost({super.key});

  @override
  Widget build(BuildContext context) {
    final consumerProvider = Provider.of<ConsumerProvider>(context);
    return consumerProvider.loggedInConsumer == null
        ? Scaffold(
            body: SafeArea(
              child: Column(
                children: [
                  const Padding(
                    padding: EdgeInsets.all(15.0),
                    child: Text(
                      'Notificaciones',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 25,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: SizeResponsize.blockSizeVertical(35),
                  ),
                  Center(
                    child: Text(
                      'Inicie Sesión para ver sus Notificaciones',
                      style: TextStyle(
                        fontSize: SizeResponsize.textSize(20),
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
            ),
            bottomNavigationBar: customBottomNavigationBar(4, context),
          )
        : Scaffold(
            body: const SafeArea(
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.all(15.0),
                    child: Text(
                      'Notificaciones',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 25,
                      ),
                    ),
                  ),
                  CustomNotificationListTile(
                    name: 'Liandry Diaz',
                    pathMultimedia:
                        'https://newprofilepic2.photo-cdn.net//assets/images/article/profile.jpg',
                  ),
                  CustomNotificationListTile(
                    name: 'Jesus Perez',
                    pathMultimedia:
                        'https://www.superprof.pe/imagenes/anuncios/profesor-home-vato-lleva-seis-anos-tocando-piano-pues-toca-chido-jaja-nomas-para-hechar-coto-impresionar-tus-ligues.jpg',
                  ),
                ],
              ),
            ),
            bottomNavigationBar: customBottomNavigationBar(4, context),
          );
  }
}
