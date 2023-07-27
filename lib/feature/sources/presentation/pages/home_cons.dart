import 'package:finder_pymes/feature/consumer/presentation/widgets/textformfield_customer.dart';
import 'package:finder_pymes/feature/post/presentation/widgets/bottom_navbar.dart';
import 'package:finder_pymes/feature/post/presentation/widgets/category.dart';
import 'package:finder_pymes/feature/pymes/presentation/providers/widget_pymes_provider.dart';
import 'package:finder_pymes/settings/size_responsive.dart';
import 'package:finder_pymes/settings/styles/colors.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeFirst extends StatelessWidget {
  const HomeFirst({super.key});

  @override
  Widget build(BuildContext context) {
    final categoryProvider = Provider.of<CategoryProvider>(context);

    final TextEditingController searchController = TextEditingController();

    double sizeTextTittle = SizeResponsize.textSize(22);
    double sizeTextNormal = SizeResponsize.textSize(16);
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                width: SizeResponsize.blockSizeHorizontal(85),
                height: SizeResponsize.blockSizeVertical(18),
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'Bienvenido...',
                          style: TextStyle(
                            fontSize: sizeTextTittle,
                            color: DataColors.colorPinkBackground,
                          ),
                        ),
                      ),
                      CustomerTextFormField(
                        label: 'Buscar Categoria',
                        iconSuffixIcon: const Icon(Icons.search),
                        borderColor: DataColors.colorBlack,
                        typeKeyboard: TextInputType.text,
                        obscureText: false,
                        controller: searchController,
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: SizeResponsize.textSize(20),
                ),
                // ignore: unnecessary_null_comparison
                child: searchController.text == null
                    ? ListView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: categoryProvider.categories.length,
                        itemBuilder: (context, index) {
                          var category = categoryProvider.categories[index];
                          if (category['name']?.toLowerCase().contains(
                                  searchController.text.toLowerCase()) ??
                              false) {
                            return CustomerCategory(
                              sizeTextTittle: sizeTextNormal,
                              urlImage: category['imagePath'] ??
                                  'assets/images/category/error.jpg',
                              label: category['name'] ?? 'ERROR',
                              longSize: true,
                            );
                          } else {
                            return Center(
                              child: Text(
                                'No se encontro la categoria',
                                style: TextStyle(fontSize: sizeTextTittle),
                              ),
                            );
                          }
                        },
                      )
                    : ValueListenableBuilder(
                        valueListenable: searchController,
                        builder: (context, value, child) {
                          return ListView.builder(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: categoryProvider.categories.length,
                            itemBuilder: (context, index) {
                              var category = categoryProvider.categories[index];
                              if (category['name']?.toLowerCase().contains(
                                      searchController.text.toLowerCase()) ??
                                  false) {
                                return CustomerCategory(
                                  sizeTextTittle: sizeTextNormal,
                                  urlImage: category['imagePath'] ??
                                      'assets/images/category/error.jpg',
                                  label: category['name'] ?? 'ERROR',
                                  longSize: true,
                                );
                              } else {
                                return Container();
                              }
                            },
                          );
                        },
                      ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: customBottomNavigationBar(1, context),
    );
  }
}
