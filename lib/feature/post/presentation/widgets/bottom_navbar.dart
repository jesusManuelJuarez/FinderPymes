import 'package:finder_pymes/feature/consumer/presentation/pages/first_view.dart';
import 'package:finder_pymes/feature/consumer/presentation/pages/profile.dart';
import 'package:finder_pymes/feature/consumer/presentation/provider/consumer_provider.dart';
import 'package:finder_pymes/feature/consumer/presentation/provider/data_consumer_provider.dart';
import 'package:finder_pymes/feature/post/presentation/pages/home_cons.dart';
import 'package:finder_pymes/feature/post/presentation/pages/notifications.dart';
import 'package:finder_pymes/feature/post/presentation/pages/search.dart';
import 'package:finder_pymes/feature/pymes/presentation/pages/profile_pymes.dart';
import 'package:finder_pymes/feature/pymes/presentation/pages/registerPymes.dart';
import 'package:finder_pymes/settings/size_responsive.dart';
import 'package:finder_pymes/settings/styles/colors.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

Widget customBottomNavigationBar(
    int optionSelectToColor, BuildContext context) {
  ConsumerProvider consumerProvider = Provider.of<ConsumerProvider>(context);
  PymesProvider pymesProvider = Provider.of<PymesProvider>(context);
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Container(
      height: SizeResponsize.blockSizeVertical(7),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: DataColors.colorWhite,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 5,
            blurRadius: 7,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Row(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(4.0),
              child: Container(
                decoration: decorationOptionBarSelect(optionSelectToColor, 1),
                height: 60,
                child: IconButton(
                  onPressed: () {
                    if (optionSelectToColor != 1) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const HomeFirst(),
                        ),
                      );
                    }
                  },
                  icon: const Icon(
                    Icons.home,
                    color: DataColors.colorBlack,
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(4.0),
              child: Container(
                decoration: decorationOptionBarSelect(optionSelectToColor, 2),
                height: 60,
                child: IconButton(
                  onPressed: () {
                    Widget? nextPage;
                    if (optionSelectToColor != 2) {
                      if (consumerProvider.loggedInConsumer == null) {
                        nextPage = const RegisterPymesPage();
                      } else if (pymesProvider.listPymesData.any((pymes) =>
                          consumerProvider.loggedInConsumer!.id ==
                          pymes.idConsumer)) {
                        nextPage = const ProfilePymesPage();
                      }
                      if (nextPage != null) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const RegisterPymesPage(),
                          ),
                        );
                      }
                    }
                  },
                  icon: const Icon(
                    Icons.business_center,
                    color: DataColors.colorBlack,
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  gradient: const LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: <Color>[
                      Color(0xFF0468FC),
                      Color.fromARGB(255, 43, 120, 237),
                    ],
                  ),
                ),
                height: 60,
                child: IconButton(
                  onPressed: () {
                    if (optionSelectToColor != 3) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const SearchView(),
                        ),
                      );
                    }
                  },
                  icon: const Icon(
                    Icons.search,
                    color: DataColors.colorWhite,
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(4.0),
              child: Container(
                decoration: decorationOptionBarSelect(optionSelectToColor, 4),
                height: 60,
                child: IconButton(
                  onPressed: () {
                    if (optionSelectToColor != 4) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const NotificationsPost(),
                        ),
                      );
                    }
                  },
                  icon: const Icon(
                    Icons.notifications,
                    color: DataColors.colorBlack,
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(4.0),
              child: Container(
                decoration: decorationOptionBarSelect(optionSelectToColor, 5),
                height: 60,
                child: IconButton(
                  onPressed: () {
                    if (optionSelectToColor != 5) {
                      consumerProvider.loggedInConsumer == null
                          ? Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const FirstViewPage(),
                              ),
                            )
                          : Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const ProfileConsumer(),
                              ),
                            );
                    }
                  },
                  icon: const Icon(
                    Icons.person,
                    color: DataColors.colorBlack,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    ),
  );
}

BoxDecoration decorationOptionBarSelect(
    int optionSelectToColor, int optionSelect) {
  return BoxDecoration(
    borderRadius: BorderRadius.circular(15),
    color: optionSelectToColor == optionSelect
        ? DataColors.colorPinkSuaveTransparent
        : const Color.fromARGB(0, 255, 255, 255),
  );
}
