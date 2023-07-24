class PymesData {
  int id;
  String name;
  String description;
  String type;
  String website;
  int idConsumer;

  PymesData({
    required this.id,
    required this.name,
    required this.description,
    required this.type,
    required this.website,
    required this.idConsumer,
  });
}

class PymesAddress {
  int id;
  String city;
  String longitud;
  String latitud;
  String district;
  String postalCode;
  String cell;
  int idPymes;

  PymesAddress({
    required this.id,
    required this.city,
    required this.longitud,
    required this.latitud,
    required this.district,
    required this.postalCode,
    required this.cell,
    required this.idPymes,
  });
}

class PymesFiscal {
  int id;
  String rfc;
  String regimeT;
  String fiscalAddress;
  int idPymes;

  PymesFiscal({
    required this.id,
    required this.rfc,
    required this.regimeT,
    required this.fiscalAddress,
    required this.idPymes,
  });
}
