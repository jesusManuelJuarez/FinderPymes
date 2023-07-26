import 'package:flutter/material.dart';

class CategoryProvider with ChangeNotifier {
  String? _selectedCategory;
  final List<Map<String, String>> _categories = [
    {
      'name': 'Alimentos y Bebidas',
      'imagePath': 'assets/images/categories/food_and_beverages.jpg',
    },
    {
      'name': 'Ropa y Accesorios',
      'imagePath': 'assets/images/categories/clothing_and_accessories.jpg',
    },
    {
      'name': 'Salud y Belleza',
      'imagePath': 'assets/images/categories/health_and_beauty.jpg',
    },
    {
      'name': 'Hogar y Jardín',
      'imagePath': 'assets/images/categories/home_and_garden.jpg',
    },
    {
      'name': 'Tecnología',
      'imagePath': 'assets/images/categories/technology.jpg',
    },
    {
      'name': 'Automotriz',
      'imagePath': 'assets/images/categories/automotive.jpg',
    },
    {
      'name': 'Servicios Profesionales',
      'imagePath': 'assets/images/categories/professional_services.jpg',
    },
    {
      'name': 'Entretenimiento y Ocio',
      'imagePath': 'assets/images/categories/entertainment_and_leisure.jpg',
    },
    {
      'name': 'Educación y Formación',
      'imagePath': 'assets/images/categories/education_and_training.jpg',
    },
    {
      'name': 'Viajes y Alojamiento',
      'imagePath': 'assets/images/categories/travel_and_accommodation.jpg',
    },
  ];

  String? get selectedCategory => _selectedCategory;
  List<Map<String, String>> get categories => _categories;

  void selectCategory(String? category) {
    _selectedCategory = category;
    notifyListeners();
  }
}
