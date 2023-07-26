// ignore_for_file: prefer_typing_uninitialized_variables, avoid_print

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class ImagePickerProvider with ChangeNotifier {
  File? imagen;
  final picker = ImagePicker();

  Future<void> selImagen(int op) async {
    var pickedFile;
    if (op == 1) {
      pickedFile = await picker.pickImage(source: ImageSource.camera);
    } else {
      pickedFile = await picker.pickImage(source: ImageSource.gallery);
    }

    if (pickedFile != null) {
      imagen = File(pickedFile.path);
      notifyListeners();
    } else {
      print('No se seleccionó una foto');
    }
  }
}
