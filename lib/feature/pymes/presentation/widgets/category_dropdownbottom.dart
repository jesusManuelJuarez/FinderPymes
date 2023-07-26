import 'package:finder_pymes/feature/pymes/presentation/providers/widget_pymes_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CategoryDropdown extends StatelessWidget {
  const CategoryDropdown({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<CategoryProvider>(
      builder: (context, categoryProvider, child) {
        return DropdownButton<String>(
          value: categoryProvider.selectedCategory,
          hint: const Text('Selecciona una categoría'),
          onChanged: (String? newValue) {
            categoryProvider.selectCategory(newValue);
          },
          items: categoryProvider.categories.map<DropdownMenuItem<String>>((Map<String, String> category) {
            return DropdownMenuItem<String>(
              value: category['name'],
              child: Text(category['name']!),
            );
          }).toList(),
        );
      },
    );
  }
}
