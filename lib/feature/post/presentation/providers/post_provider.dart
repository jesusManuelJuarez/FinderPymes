import 'package:flutter/material.dart';

class PostProvider with ChangeNotifier {
  final List<Map<String, dynamic>> _productsOrServices = [
    {
      'nameProduct': 'Aspirina',
      'namePyme': 'Farmacia del Ahorro',
      'price': '\$45.00 MXN',
      'urlImage':
          'https://www.fahorro.com/media/catalog/product/cache/3fba745dcec88e97bfe808bedc471260/7/5/7501008491966_1_2.jpg',
      'type': 'Salud y Belleza',
    },
    {
      'nameProduct': 'Guitarra folklórica 38',
      'namePyme': 'Bodega Aurrera',
      'price': '\$852.00 MXN',
      'urlImage':
          'https://i5.walmartimages.com.mx/mg/gm/3pp/asr/036fc58d-3e5f-4553-98be-d6065fe4b7a3.fa6f6d52b6127154b01ff0780af5a0be.jpeg?odnHeight=2000&odnWidth=2000&odnBg=FFFFFF',
      'type': 'Musica y Grupos',
    },
    {
      'nameProduct': 'CREMA CORPORAL LUBRIDERM',
      'namePyme': 'Farmacia del Ahorro',
      'price': '\$31.00 MXN',
      'urlImage':
          'https://www.fahorro.com/media/catalog/product/cache/3fba745dcec88e97bfe808bedc471260/7/5/7501007528939_1.jpg',
      'type': 'Salud y Belleza',
    },
  ];

  
  List<Map<String, dynamic>> get productsOrServices => _productsOrServices;
}
