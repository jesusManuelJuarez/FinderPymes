import 'package:finder_pymes/settings/styles/colors.dart';
import 'package:flutter/material.dart';

class CustomNotificationListTile extends StatelessWidget {
  final String name;
  final String pathMultimedia;
  const CustomNotificationListTile({
    super.key,
    required this.name,
    required this.pathMultimedia,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
          color: DataColors.colorWhite13Trasnparent,
          borderRadius: BorderRadius.circular(20.0),
        ),
        child: ListTile(
          leading: CircleAvatar(
            backgroundImage: NetworkImage(
              pathMultimedia,
            ),
            radius: 30,
          ),
          title: Text('$name subio un nuevo Producto/Servicio. Ve a Checarlo'),
        ),
      ),
    );
  }
}
