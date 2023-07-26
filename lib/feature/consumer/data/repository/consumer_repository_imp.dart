import 'dart:io';

import 'package:finder_pymes/feature/consumer/data/datasource/consumer_remote_datasource.dart';
import 'package:finder_pymes/feature/consumer/domain/entities/consumer_entity.dart';
import 'package:finder_pymes/feature/consumer/domain/repositories/consumer_repository.dart';

class ConsumerRepositoryImp implements ConsumerRepository {
  final ConsumerRemoteDataSource consumerRemoteDataSource;

  ConsumerRepositoryImp({required this.consumerRemoteDataSource});

  @override
  Future<String> createConsumer(ConsumerData consumer) async {
    return await consumerRemoteDataSource.createConsumer(consumer);
  }

  @override
  Future<List<ConsumerData>> getConsumer() async {
    return await consumerRemoteDataSource.getConsumer();
  }

  @override
  Future<ConsumerData> loginConsumer(String email, String password) async {
    return await consumerRemoteDataSource.loginConsumer(email, password);
  }
  
  @override
  Future<String> uploadPhoto(File image) async {
    return await consumerRemoteDataSource.uploadPhoto(image);
  }

}