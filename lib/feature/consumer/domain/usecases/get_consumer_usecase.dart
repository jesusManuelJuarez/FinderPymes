import 'package:finder_pymes/feature/consumer/domain/entities/consumer_entity.dart';
import 'package:finder_pymes/feature/consumer/domain/repositories/consumer_repository.dart';

class GetConsumerUsecase {
  final ConsumerRepository consumerRepository;

  GetConsumerUsecase({required this.consumerRepository});

  Future<List<ConsumerData>> execute() async{
    return await consumerRepository.getConsumer();
  }
}