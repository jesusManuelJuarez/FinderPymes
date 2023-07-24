// ignore_for_file: avoid_print

import 'package:finder_pymes/feature/consumer/domain/entities/consumer_entity.dart';
import 'package:finder_pymes/feature/consumer/domain/usecases/get_consumer_usecase.dart';
import 'package:finder_pymes/feature/consumer/domain/usecases/login_consumer_usecase.dart';
import 'package:flutter/material.dart';

class ConsumerProvider with ChangeNotifier {
  final GetConsumerUsecase getConsumerUsecase;
  final LoginConsumerUsecase loginConsumerUsecase;

  List<ConsumerData>? _consumers;

  List<ConsumerData>? get consumers => _consumers;

  ConsumerData? _loggedInConsumer;

  ConsumerData? get loggedInConsumer => _loggedInConsumer;

  ConsumerProvider(this.getConsumerUsecase, this.loginConsumerUsecase);

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

  Future<void> loginConsumer(ConsumerData consumer) async {
    try {
      _loggedInConsumer = await loginConsumerUsecase.execute(consumer);

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
}
