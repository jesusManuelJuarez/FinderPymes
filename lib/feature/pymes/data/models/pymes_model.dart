import 'package:finder_pymes/feature/pymes/domain/entities/pymes_entity.dart';

class PymesModel extends PymesData {
  PymesModel({
    required int id,
    required String name,
    required String description,
    required String type,
    required String website,
    required int idConsumer,
  }) : super(
          id: id,
          name: name,
          description: description,
          type: type,
          website: website,
          idConsumer: idConsumer,
        );
}

class PymesAddressModel extends PymesAddress {
  PymesAddressModel({
    required int id,
    required String city,
    required String longitud,
    required String latitud,
    required String district,
    required String postalCode,
    required String cell,
    required int idPymes,
  }) : super(
            id: id,
            city: city,
            longitud: longitud,
            latitud: latitud,
            district: district,
            postalCode: postalCode,
            cell: cell,
            idPymes: idPymes);
}

class PymesFiscalModel extends PymesFiscal {
  PymesFiscalModel({
    required int id,
    required String rfc,
    required String regimeT,
    required String fiscalAddress,
    required int idPymes,
  }) : super(
          id: id,
          rfc: rfc,
          regimeT: regimeT,
          fiscalAddress: fiscalAddress,
          idPymes: idPymes,
        );
}
