import 'package:finder_pymes/feature/post/presentation/widgets/bottom_navbar.dart';
import 'package:finder_pymes/feature/post/presentation/widgets/notification_listile.dart';
import 'package:flutter/material.dart';

class NotificationsPost extends StatelessWidget {
  const NotificationsPost({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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