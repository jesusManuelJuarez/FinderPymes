import 'package:finder_pymes/feature/pymes/domain/entities/pymes_entity.dart';
import 'package:finder_pymes/feature/pymes/domain/repositories/pymes_repository.dart';

class CreatePymesUsecase{
  final PymesRepository pymesRepository;

  CreatePymesUsecase({required this.pymesRepository});

  Future<String> execute(PymesData pymes) async {
    return await pymesRepository.createPymes(pymes);
  }
}