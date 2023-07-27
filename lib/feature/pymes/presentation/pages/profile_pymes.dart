import 'package:finder_pymes/feature/post/presentation/widgets/bottom_navbar.dart';
import 'package:finder_pymes/feature/pymes/presentation/widgets/maps_profile_pymes.dart';
import 'package:finder_pymes/settings/size_responsive.dart';
import 'package:finder_pymes/settings/styles/colors.dart';
import 'package:flutter/material.dart';

class ProfilePymesPage extends StatelessWidget {
  const ProfilePymesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: DataColors.colorWhite,
      body: SafeArea(
        child: SingleChildScrollView(
          child: SizedBox(
            height: SizeResponsize.sizeScreenHeigth,
            width: SizeResponsize.sizeScreenWidth,
            child: Column(
              children: [
                photoAndBanner(),
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: SizeResponsize.textSize(20),
                    vertical: SizeResponsize.textSize(5),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Farmacias del Ahorro', // NAME
                        style: TextStyle(
                            fontSize: SizeResponsize.textSize(20),
                            fontWeight: FontWeight.bold),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 5),
                        child: Text(
                          // Descripcion
                          'Con el Monedero del Ahorro disfruta de grandes beneficios al realizar tus compras online. Visítanos y descubre las mejores promociones que tenemos para ti.',
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
                        url: 'www.fahorro.com',
                        onPressed: () {},
                      ),
                      DatasCustomPymes(
                        label: 'Numero telefonico',
                        url: '+52 961 576 9875',
                        onPressed: () {},
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                          vertical: SizeResponsize.textSize(10),
                        ),
                        child: Text(
                          'San Roque, Tuxtla Gutierrez (29040)',
                          style: TextStyle(
                              fontSize: SizeResponsize.textSize(15),
                              fontWeight: FontWeight.w400),
                        ),
                      ),
                      const Divider(
                        thickness: 2,
                      ),
                      // const SizedBox(
                      //   child: MapGoogleCustomerProfileRegister(
                      //     latitud: 16.750668237687478,
                      //     longitud: -93.1149489446051,
                      //   ),
                      // )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: customBottomNavigationBar(2, context),
    );
  }

  Container photoAndBanner() {
    return Container(
      width: SizeResponsize.sizeScreenWidth,
      height: SizeResponsize.blockSizeVertical(32),
      color: DataColors.colorWhite,
      child: Stack(
        children: [
          SizedBox(
            height: SizeResponsize.blockSizeVertical(23),
            width: SizeResponsize.sizeScreenWidth,
            child: const Image(
              image: NetworkImage(
                'https://retailers.mx/revista/wp-content/uploads/2021/08/farmacias-del-ahorro-e1614015544787.jpg',
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
                      image:
                          'https://agenciacentral.mx/images/portafolio/LogosloganaltaFA.jpg',
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
    super.key,
    required this.label,
    required this.url,
    this.onPressed,
  });

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
          TextButton(
            onPressed: onPressed,
            child: Text(
              url,
              style: TextStyle(
                  fontSize: SizeResponsize.textSize(15),
                  fontWeight: FontWeight.w300),
            ),
          ),
        ],
      ),
    );
  }
}
