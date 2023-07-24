import '../entities/consumer_entity.dart';

abstract class ConsumerRepository {
  Future<String> createConsumer(ConsumerData consumer);
  Future<List<ConsumerData>> getConsumer();
  Future<ConsumerData> loginConsumer(ConsumerData consumer);
}