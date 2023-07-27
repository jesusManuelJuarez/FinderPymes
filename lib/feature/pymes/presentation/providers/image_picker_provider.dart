// ignore_for_file: prefer_typing_uninitialized_variables, avoid_print

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class ImagePickerProviderPymes with ChangeNotifier {
  File? imagen;
  final picker = ImagePicker();

  Future<File?> getImage() async {
    final ImagePicker picker = ImagePicker();
    final XFile? pickedFile =
        await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      final File image = File(pickedFile.path);
      return image;
    }

    return null;
  }

  Future<String> uploadImage(File imageToUpload, String daa) async {
    try {
      String url = await uploadPhoto(imageToUpload, daa);
      return url;
    } catch (e) {
      print('Hubo un error en PostProvider.uploadImage $e');
      rethrow;
    }
  }

  Future<String> uploadPhoto(File image, String daa) async {
    FirebaseStorage storage = FirebaseStorage.instance;
    final String namefield = image.path.split('/').last;
    final Reference ref =
        storage.ref().child('pymes').child(daa).child(namefield);
    final UploadTask uploadTask = ref.putFile(image);
    final TaskSnapshot snapshot = await uploadTask.whenComplete(() => true);
    final String urlPhoto = await snapshot.ref.getDownloadURL();
    return urlPhoto;
    // return '';
  }
}
