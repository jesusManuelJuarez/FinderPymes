import 'package:finder_pymes/feature/consumer/presentation/provider/consumer_provider.dart';
import 'package:finder_pymes/feature/pymes/domain/entities/pymes_entity.dart';
import 'package:flutter/material.dart';

class PymesProvider with ChangeNotifier {
  final List<PymesData> _pymesDataList = [
    PymesData(
      id: 1,
      name: 'Abarrotes "El Buen Sabor"',
      description:
          '"Abarrotes El Buen Sabor" es una tienda de conveniencia ubicada en el corazón de la comunidad, dedicada a satisfacer las necesidades diarias de nuestros clientes ofreciendo una amplia variedad de productos y servicios. Nuestro negocio se enorgullece de brindar una experiencia de compra conveniente, amigable y cercana, donde los clientes pueden encontrar todo lo que necesitan para su hogar y sus necesidades básicas.',
      type: 'Alimentos y Bebidas',
      website: '',
      idConsumer: 1,
    ),
    PymesData(
      id: 2,
      name: 'Farmacia "Salud y Bienestar"',
      description:
          '"Farmacia Salud y Bienestar" es una farmacia comprometida con el bienestar de la comunidad, ubicada estratégicamente para brindar servicios y productos farmacéuticos de calidad. Nuestra farmacia se destaca por ofrecer una amplia gama de medicamentos, productos de cuidado personal y asesoramiento experto para satisfacer las necesidades de nuestros clientes en temas de salud y bienestar.',
      type: 'Salud y Belleza',
      website: '',
      idConsumer: 3,
    ),
  ];

  final List<PymesAddress> _pymesAddressList = [
    PymesAddress(
      id: 1,
      city: 'Tuxtla Gutierrez',
      longitud: '16.75835206097263',
      latitud: '-93.11687539806027',
      district: 'Colon',
      postalCode: '29037',
      cell: '961 555 942',
      idPymesData: 1,
    ),
    PymesAddress(
      id: 2,
      city: 'San Cristobal de las Casas',
      longitud: '16.732290627308217',
      latitud: '-92.63877285636946',
      district: 'Álvaro Obregon',
      postalCode: '29250',
      cell: '967 129 2951',
      idPymesData: 2,
    ),
  ];

  final List<PymesFiscal> _pymesFiscalList = [
    PymesFiscal(
      id: 1,
      rfc: '',
      regimeT: '',
      fiscalAddress: '',
      idPymesData: 1,
    ),
    PymesFiscal(
      id: 2,
      rfc: 'ECO201001ABC',
      regimeT: 'Régimen General de Ley Personas Morales',
      fiscalAddress:
          ' Calle Ficticia #123, Colonia Imaginaria, Ciudad Ficticia, Estado Ficticio, Código Postal 56789',
      idPymesData: 2,
    ),
  ];

  bool? _consumerHasAnPyme;

  List<PymesData> get listPymesData => _pymesDataList;
  List<PymesAddress> get listPymesAddress => _pymesAddressList;
  List<PymesFiscal> get listPymesFiscal => _pymesFiscalList;
  bool? get consuemerHasAnPyme => _consumerHasAnPyme;

  void checkIfTheConsumerHasAnPyme(ConsumerProvider consumerProvider) {
    for (var pyme in _pymesDataList) {
      if (consumerProvider.loggedInConsumer!.id == pyme.idConsumer) {
        _consumerHasAnPyme = true;
        notifyListeners();
        break;
      }
    }
  }
}
