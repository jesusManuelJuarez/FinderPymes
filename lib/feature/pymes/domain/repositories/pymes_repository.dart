import 'package:finder_pymes/feature/pymes/domain/entities/pymes_entity.dart';

abstract class PymesRepository {
  Future<List<PymesData>> getPymes();
  Future<String> createPymes(PymesData pymes);
}