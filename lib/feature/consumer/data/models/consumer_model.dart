import 'package:finder_pymes/feature/consumer/domain/entities/consumer_entity.dart';

class ConsumerModel extends ConsumerData {
  ConsumerModel(
      {required int id,
      required String name,
      required String email,
      required String password,
      required int idPlantFP})
      : super(
          id: id,
          name: name,
          email: email,
          password: password,
          idPlantFP: idPlantFP,
        );
}
