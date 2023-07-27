import 'package:finder_pymes/feature/post/presentation/widgets/bottom_navbar.dart';
import 'package:finder_pymes/feature/post/presentation/widgets/pymes_post.dart';
import 'package:finder_pymes/feature/pymes/presentation/providers/pymes_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PymesPostPage extends StatelessWidget {
  final String type;
  const PymesPostPage({super.key, required this.type});

  @override
  Widget build(BuildContext context) {
    final pymesProvider = Provider.of<PymesProvider>(context);
    List<Map<String, dynamic>> pymes =
        pymesProvider.listPymes.where((pyme) => pyme['type'] == type).toList();

    return Scaffold(
      body: SafeArea(
        child: Center(
          child: pymes.isEmpty
              ? const Center(
                  child: Text('No hay Negocios de esta categoria'),
                )
              : ListView.builder(
                  itemCount: pymes.length,
                  itemBuilder: (context, index) {
                    return PymesPost(
                      profileImageUrl: pymes[index]['urlPhotoProfile'],
                      bannerImageUrl: pymes[index]['urlBannerProfile'],
                      pymeName: pymes[index]['name'],
                      location:
                          '${pymes[index]['colonia']}, ${pymes[index]['city']} (${pymes[index]['zipCode']})',
                      phoneNumber: pymes[index]['phoneNumber'],
                      category: pymes[index]['type'],
                    );
                  },
                ),
        ),
      ),
      bottomNavigationBar: customBottomNavigationBar(1, context),
    );
  }
}
