import 'dart:io';

import '../entities/consumer_entity.dart';

abstract class ConsumerRepository {
  Future<String> createConsumer(ConsumerData consumer);
  Future<List<ConsumerData>> getConsumer();
  Future<ConsumerData> loginConsumer(String email, String password);
  Future<String> uploadPhoto(File image);
}