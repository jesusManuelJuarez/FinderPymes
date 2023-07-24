import '../../domain/entities/pymes_entity.dart';

abstract class PymesRemoteDataSource {
  Future<List<PymesData>> getPymes();
  Future<String> createPymes(PymesData pymes);
}

class PymesRemoteDataSourceImp implements PymesRemoteDataSource {
  @override
  Future<List<PymesData>> getPymes() {
    // TODO: implement getPymes
    throw UnimplementedError();
  }

  @override
  Future<String> createPymes(PymesData pymes) {
    // TODO: implement createPymes
    throw UnimplementedError();
  }
}
