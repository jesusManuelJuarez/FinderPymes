import 'package:finder_pymes/settings/size_responsive.dart';
import 'package:finder_pymes/settings/styles/colors.dart';
import 'package:flutter/material.dart';


Widget customBottomNavigationBar(
    int optionSelectToColor, BuildContext context) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Container(
      height: SizeResponsize.blockSizeVertical(7),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: DataColors.colorPinkSuave,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 5,
            blurRadius: 7,
            offset: const Offset(0, 3), // Posiciona la sombra
          ),
        ],
      ),
      child: Row(
        children: [
          Expanded(
            child: Container(
              decoration: decorationOptionBarSelect(optionSelectToColor, 1),
              height: 60,
              child: IconButton(
                onPressed: () {
                  if (optionSelectToColor != 1) {}
                },
                icon: const Icon(
                  Icons.home,
                  color: DataColors.colorBlack,
                ),
              ),
            ),
          ),
          Expanded(
            child: Container(
              decoration: decorationOptionBarSelect(optionSelectToColor, 2),
              height: 60,
              child: IconButton(
                onPressed: () {
                  if (optionSelectToColor != 2) {
                    // Navigator.push(
                    //   context,
                    //   MaterialPageRoute(
                    //     builder: (context) => const HomePost(),
                    //   ),
                    // );
                  }
                },
                icon: const Icon(
                  Icons.menu,
                  color: DataColors.colorBlack,
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
                      // Navigator.push(
                      //   context,
                      //   MaterialPageRoute(
                      //     builder: (context) => const CreatePostView(),
                      //   ),
                      // );
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
            child: Container(
              decoration: decorationOptionBarSelect(optionSelectToColor, 4),
              height: 60,
              child: IconButton(
                onPressed: () {
                  if (optionSelectToColor != 4) {
                    // Navigator.push(
                    //   context,
                    //   MaterialPageRoute(
                    //     builder: (context) => const NotificationPosts(),
                    //   ),
                    // );
                  }
                },
                icon: const Icon(
                  Icons.notifications,
                  color: DataColors.colorBlack,
                ),
              ),
            ),
          ),
          Expanded(
            child: Container(
              decoration: decorationOptionBarSelect(optionSelectToColor, 5),
              height: 60,
              child: IconButton(
                onPressed: () {
                  if (optionSelectToColor != 5) {
                    // Navigator.push(
                    //   context,
                    //   MaterialPageRoute(
                    //     builder: (context) => const ProfileView(),
                    //   ),
                    // );
                  }
                },
                icon: const Icon(
                  Icons.person,
                  color: DataColors.colorBlack,
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
        ? DataColors.colorWhite13Trasnparent
        : const Color(0x00000000),
  );
}
