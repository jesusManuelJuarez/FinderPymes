import 'package:finder_pymes/feature/pymes/domain/entities/pymes_entity.dart';
import 'package:finder_pymes/feature/pymes/domain/repositories/pymes_repository.dart';

class GetPymesUsecase{
  final PymesRepository pymesRepository;

  GetPymesUsecase({required this.pymesRepository});

  Future<List<PymesData>> execute() async {
    return await pymesRepository.getPymes();
  }
}