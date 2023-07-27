import 'package:flutter/material.dart';

class CategoryProvider with ChangeNotifier {
  String? _selectedCategory;
  final List<Map<String, String>> _categories = [
    {
      'name': 'Alimentos y Bebidas',
      'imagePath': 'assets/images/category/alimentos_y_bebidas.jpg',
    },
    {
      'name': 'Ropa y Accesorios',
      'imagePath': 'assets/images/category/ropa_y_accessorios.jpg',
    },
    {
      'name': 'Salud y Belleza',
      'imagePath': 'assets/images/category/salud_y_belleza.jpg',
    },
    {
      'name': 'Hogar y Jardín',
      'imagePath': 'assets/images/category/hogar_y_jardin.jpg',
    },
    {
      'name': 'Tecnología',
      'imagePath': 'assets/images/category/tecnologia.jpg',
    },
    {
      'name': 'Automotriz',
      'imagePath': 'assets/images/category/automotriz.jpg',
    },
    {
      'name': 'Servicios Profesionales',
      'imagePath': 'assets/images/category/servicios_profesionales.jpg',
    },
    {
      'name': 'Entretenimiento y Ocio',
      'imagePath': 'assets/images/category/entretenimiento_y_ocio.jpg',
    },
    {
      'name': 'Educación y Formación',
      'imagePath': 'assets/images/category/educacion_y_formacion.jpg',
    },
    {
      'name': 'Viajes y Alojamiento',
      'imagePath': 'assets/images/category/viajes_y_alojamiento.jpg',
    },
    {
      'name': 'Musica y Grupos',
      'imagePath': 'assets/images/category/musica_y_grupos.jpg',
    },
  ];

  String? get selectedCategory => _selectedCategory;
  List<Map<String, String>> get categories => _categories;

  void selectCategory(String? category) {
    _selectedCategory = category;
    notifyListeners();
  }
}
