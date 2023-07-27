import 'package:finder_pymes/feature/consumer/presentation/provider/consumer_provider.dart';
import 'package:finder_pymes/feature/post/presentation/widgets/bottom_navbar.dart';
import 'package:finder_pymes/feature/pymes/presentation/providers/pymes_provider.dart';
import 'package:finder_pymes/feature/pymes/presentation/widgets/maps_profile_pymes.dart';
import 'package:finder_pymes/settings/size_responsive.dart';
import 'package:finder_pymes/settings/styles/colors.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProfilePymesPage extends StatelessWidget {
  const ProfilePymesPage({super.key});

  @override
  Widget build(BuildContext context) {
    final pymesProvider = Provider.of<PymesProvider>(context);
    final consumerProvider = Provider.of<ConsumerProvider>(context);
    Map<String, dynamic>? pyme = pymesProvider.usersPyme(consumerProvider);

    return Scaffold(
      backgroundColor: DataColors.colorWhite,
      body: SafeArea(
        child: SingleChildScrollView(
          child: pyme == null
              ? const Center(
                  child: Text('No se encontro el negocio del usuario'),
                )
              : Column(
                  children: [
                    photoAndBanner(pyme),
                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: SizeResponsize.textSize(20),
                        vertical: SizeResponsize.textSize(5),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            pyme['name'], // NAME
                            style: TextStyle(
                                fontSize: SizeResponsize.textSize(20),
                                fontWeight: FontWeight.bold),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 5),
                            child: Text(
                              // Descripcion
                              pyme['description'],
                              style: TextStyle(
                                fontSize: SizeResponsize.textSize(12),
                              ),
                              textAlign: TextAlign.justify,
                            ),
                          ),
                          const Divider(
                            thickness: 2,
                          ),
                          DatasCustomPymes(
                            label: 'Sitio Web',
                            url: pyme['urlWebSite'],
                            onPressed: () {},
                          ),
                          DatasCustomPymes(
                            label: 'Numero telefonico',
                            url: pyme['phoneNumber'],
                            onPressed: () {},
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(
                              vertical: SizeResponsize.textSize(10),
                            ),
                            child: Text(
                              '${pyme['colonia']}, ${pyme['city']} (${pyme['zipCode']})',
                              style: TextStyle(
                                  fontSize: SizeResponsize.textSize(15),
                                  fontWeight: FontWeight.w400),
                            ),
                          ),
                          const Divider(
                            thickness: 2,
                          ),
                          Container(
                            height: SizeResponsize.textSize(200),
                            width: double.infinity,
                            color: const Color(0xFF000000),
                            child: MapGoogleCustomerProfileRegister(
                              latitud: pyme['latitud'],
                              longitud: pyme['longitud'],
                            ),
                          ),
                          const Divider(
                            thickness: 2,
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(
                                vertical: SizeResponsize.textSize(10)),
                            child: Align(
                              alignment: Alignment.center,
                              child: Text(
                                'Productos y/o  Servicios',
                                style: TextStyle(
                                    fontSize: SizeResponsize.textSize(15),
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                          Container(
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(4.0),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.5),
                                  spreadRadius: 1,
                                  blurRadius: 2,
                                  offset: const Offset(
                                    0,
                                    2,
                                  ), // Cambia la posición del sombreado
                                ),
                              ],
                            ),
                            child: const Center(
                              child: Text('Container con sombra'),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
        ),
      ),
      bottomNavigationBar: customBottomNavigationBar(2, context),
    );
  }

  Container photoAndBanner(Map<String, dynamic> pyme) {
    return Container(
      width: SizeResponsize.sizeScreenWidth,
      height: SizeResponsize.blockSizeVertical(32),
      color: DataColors.colorWhite,
      child: Stack(
        children: [
          SizedBox(
            height: SizeResponsize.blockSizeVertical(23),
            width: SizeResponsize.sizeScreenWidth,
            child: Image(
              image: NetworkImage(
                pyme['urlBannerProfile'],
              ),
              fit: BoxFit.none,
            ),
          ),
          Positioned(
            left: SizeResponsize.safeBlockHorizontal(5),
            top: SizeResponsize.blockSizeVertical(13),
            child: Row(
              children: [
                CircleAvatar(
                  backgroundColor: DataColors.colorBlack,
                  radius: 75,
                  child: ClipOval(
                    child: FadeInImage.assetNetwork(
                      placeholder: 'assets/images/profile_const.jpg',
                      image: pyme['urlPhotoProfile'],
                      imageErrorBuilder: (context, error, stackTrace) {
                        return Image.asset(
                          'assets/images/profile_const.jpg',
                        );
                      },
                      fit: BoxFit.cover,
                      width: 145.0,
                      height: 145.0,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class DatasCustomPymes extends StatelessWidget {
  final String label;
  final String url;
  final void Function()? onPressed;

  const DatasCustomPymes({
    Key? key,
    required this.label,
    required this.url,
    this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Row(
        children: [
          Text(
            '$label: ',
            style: TextStyle(
                fontSize: SizeResponsize.textSize(15),
                fontWeight: FontWeight.w400),
          ),
          Flexible(
            child: TextButton(
              onPressed: onPressed,
              child: Text(
                url,
                style: TextStyle(
                    fontSize: SizeResponsize.textSize(15),
                    fontWeight: FontWeight.w300),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

