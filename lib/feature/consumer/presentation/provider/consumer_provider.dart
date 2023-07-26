// ignore_for_file: avoid_print

import 'dart:io';

import 'package:finder_pymes/feature/consumer/domain/entities/consumer_entity.dart';
import 'package:finder_pymes/feature/consumer/domain/usecases/create_consumer_usecase.dart';
import 'package:finder_pymes/feature/consumer/domain/usecases/get_consumer_usecase.dart';
import 'package:finder_pymes/feature/consumer/domain/usecases/login_consumer_usecase.dart';
import 'package:finder_pymes/feature/consumer/domain/usecases/upload_photo_consumer_usecase.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ConsumerProvider with ChangeNotifier {
  final GetConsumerUsecase getConsumerUsecase;
  final LoginConsumerUsecase loginConsumerUsecase;
  final CreateConsumerUsecase createConsumerUsecase;
  final UploadPhotoConsumerUsecase uploadPhotoConsumerUsecase;

  List<ConsumerData>? _consumers;

  List<ConsumerData>? get consumers => _consumers;

  ConsumerData? _loggedInConsumer;

  ConsumerData? get loggedInConsumer => _loggedInConsumer;

  ConsumerProvider(this.getConsumerUsecase, this.loginConsumerUsecase,
      this.createConsumerUsecase, this.uploadPhotoConsumerUsecase);

  Future<void> getConsumers() async {
    try {
      _consumers = await getConsumerUsecase.execute();
      if (_consumers == null) {
        print('No se obtuvieron Consumidores');
      } else {
        print('Se obtuvieron ${_consumers!.length} Consumidores');
        notifyListeners();
      }
    } catch (e) {
      print('Hubo un error en ConsumerProvider.getConsumers $e');
      rethrow;
    }
  }

  Future<void> loginConsumer(String email, String password) async {
    try {
      _loggedInConsumer = await loginConsumerUsecase.execute(email, password);

      if (_loggedInConsumer == null) {
        print('Error a la hora de loggear');
      } else {
        print('Se logeo el Consumidor ${_loggedInConsumer!.name}');
        notifyListeners();
      }
    } catch (e) {
      print('Hubo un error en ConsumerProvider.loginConsumer $e');
    }
  }

  Future<String> registerConsumer(
      String name, String email, String password, String urlPhoto) async {
    ConsumerData newConsumer = ConsumerData(
      id: 0,
      name: name,
      email: email,
      urlPhoto: urlPhoto,
      password: password,
      idPlantFP: 0,
    );

    String newConsumerWasCreated =
        await createConsumerUsecase.execute(newConsumer);

    return newConsumerWasCreated;
  }

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

  Future<String> uploadImage(File? imageToUpload) async {
    try {
      String url = await uploadPhotoConsumerUsecase.execute(imageToUpload!);
      return url;
    } catch (e) {
      print('Hubo un error en PostProvider.uploadImage $e');
      rethrow;
    }
  }
}
