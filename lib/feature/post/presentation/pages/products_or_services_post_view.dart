import 'package:finder_pymes/feature/post/presentation/widgets/product_or_serives_ost.dart';
import 'package:finder_pymes/feature/post/presentation/providers/post_provider.dart';
import 'package:finder_pymes/feature/post/presentation/widgets/bottom_navbar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProductsOrServicesPage extends StatelessWidget {
  const ProductsOrServicesPage({super.key,});

  @override
  Widget build(BuildContext context) {
    final postProvider = Provider.of<PostProvider>(context);
    List<Map<String, dynamic>> products = postProvider.productsOrServices;

    return Scaffold(
      body: SafeArea(
        child: Center(
          child: products.isEmpty
              ? const Center(
                  child: Text('No hay productos'),
                )
              : ListView.builder(
                  itemCount: products.length,
                  itemBuilder: (context, index) {
                    return ProductOrServicesPost(
                      imageUrl: products[index]['urlImage'],
                      productName: products[index]['nameProduct'],
                      productPrice: products[index]['price'],
                      storeName: products[index]['namePyme'],
                    );
                  },
                ),
        ),
      ),
      bottomNavigationBar: customBottomNavigationBar(1, context),
    );
  }
}
