import 'package:finder_pymes/feature/consumer/domain/entities/consumer_entity.dart';
import 'package:finder_pymes/feature/consumer/domain/repositories/consumer_repository.dart';

class LoginConsumerUsecase {
  final ConsumerRepository consumerRepository;

  LoginConsumerUsecase({required this.consumerRepository});

  Future<ConsumerData> execute(String email, String password) async{
    return await consumerRepository.loginConsumer(email, password);
  }
}