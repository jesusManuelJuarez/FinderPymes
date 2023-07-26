import 'package:finder_pymes/feature/consumer/domain/repositories/consumer_repository.dart';

import '../entities/consumer_entity.dart';

class CreateConsumerUsecase{
  final ConsumerRepository consumerRepository;

  CreateConsumerUsecase(this.consumerRepository);

  Future<String> execute(ConsumerData consumer) async {
    return consumerRepository.createConsumer(consumer);
  }
}