import 'package:finder_pymes/feature/pymes/data/datasource/pymes_remote_datasource.dart';
import 'package:finder_pymes/feature/pymes/domain/entities/pymes_entity.dart';
import 'package:finder_pymes/feature/pymes/domain/repositories/pymes_repository.dart';

class PymesRepositoryImp implements PymesRepository {
  final PymesRemoteDataSource pymesRemoteDataSource;

  PymesRepositoryImp(this.pymesRemoteDataSource);

  @override
  Future<String> createPymes(PymesData pymes) async {
    return await pymesRemoteDataSource.createPymes(pymes);
  }

  @override
  Future<List<PymesData>> getPymes() async {
    return await pymesRemoteDataSource.getPymes();
  }
}
