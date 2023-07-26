import 'dart:io';

import 'package:finder_pymes/feature/consumer/domain/repositories/consumer_repository.dart';

class UploadPhotoConsumerUsecase{
  final ConsumerRepository consumerRepository;

  UploadPhotoConsumerUsecase(this.consumerRepository);

  Future<String> execute(File image) async {
    return consumerRepository.uploadPhoto(image);
  }
}