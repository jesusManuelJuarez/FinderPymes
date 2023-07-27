import 'package:finder_pymes/feature/consumer/presentation/widgets/textformfield_customer.dart';
import 'package:finder_pymes/feature/post/presentation/widgets/bottom_navbar.dart';
import 'package:finder_pymes/feature/post/presentation/widgets/product_or_serives_ost.dart';
import 'package:finder_pymes/feature/post/presentation/providers/post_provider.dart';
import 'package:finder_pymes/settings/size_responsive.dart';
import 'package:finder_pymes/settings/styles/colors.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SearchView extends StatefulWidget {
  const SearchView({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _SearchViewState createState() => _SearchViewState();
}

class _SearchViewState extends State<SearchView> {
  final TextEditingController _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    double sizeTextTittle = SizeResponsize.textSize(20);
    final postProvider = Provider.of<PostProvider>(context);
    List<Map<String, dynamic>> products = postProvider.productsOrServices;

    // Filtrar la lista de productos basándose en la entrada del usuario
    List<Map<String, dynamic>> filteredProducts = products
        .where((product) =>
            product['nameProduct']
                .toLowerCase()
                .contains(_searchController.text.toLowerCase()))
        .toList();

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(
              width: SizeResponsize.sizeScreenWidth,
              height: SizeResponsize.blockSizeVertical(18),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Align(
                    alignment: Alignment.center,
                    child: Text(
                      '¿Que desea Buscar?',
                      style: TextStyle(
                        fontSize: sizeTextTittle,
                        color: DataColors.colorPinkBackground,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: SizeResponsize.textSize(15)),
                    child: CustomerTextFormField(
                      controller: _searchController,
                      label: 'Buscar servicios o productos',
                      iconSuffixIcon: const Icon(Icons.search),
                      borderColor: DataColors.colorBlack,
                      typeKeyboard: TextInputType.text,
                      obscureText: false,
                      onChanged: (value) {
                        setState(() {});  // Actualizar la UI cuando el usuario escribe en el campo de búsqueda
                      },
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: filteredProducts.isEmpty
                  ? const Center(
                      child: Text('No hay productos'),
                    )
                  : ListView.builder(
                      itemCount: filteredProducts.length,
                      itemBuilder: (context, index) {
                        return ProductOrServicesPost(
                          imageUrl: filteredProducts[index]['urlImage'],
                          productName: filteredProducts[index]['nameProduct'],
                          productPrice: filteredProducts[index]['price'],
                          storeName: filteredProducts[index]['namePyme'],
                        );
                      },
                    ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: customBottomNavigationBar(3, context),
    );
  }
}
