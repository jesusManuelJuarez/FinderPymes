import 'package:finder_pymes/feature/consumer/presentation/provider/consumer_provider.dart';
import 'package:flutter/material.dart';

class PymesProvider with ChangeNotifier {
  final List<Map<String, dynamic>> _listPymes = [
    {
      'id': 1,
      'idUser': 1,
      'name': 'Estudiantina "Claro de Luna"',
      'description':
          'Disponibles para todo tipo de eventos social, cultural y religioso',
      'urlPhotoProfile':
          'https://firebasestorage.googleapis.com/v0/b/finderpymes-d1b7b.appspot.com/o/pymes%2Fprofile%2Festudiantinaprofile.jpg?alt=media&token=b7b89794-ab3d-4021-9c9d-c6d4e3f1192d',
      'urlBannerProfile':
          'https://firebasestorage.googleapis.com/v0/b/finderpymes-d1b7b.appspot.com/o/pymes%2Fprofile%2Festudiantinabanner.jpg?alt=media&token=339ea232-84b8-43ab-b8f9-4e519bc3da59',
      'urlWebSite':
          'https://www.facebook.com/people/Estudiantina-Claro-de-Luna/100076540765123/',
      'phoneNumber': '+52 967 126 4244',
      'colonia': 'Calle Cuba',
      'city': 'San Cristobal de las Casas',
      'zipCode': '29210',
      'latitud': 16.746222683426062,
      'longitud': -92.64231491881814,
      'type': 'Musica y Grupos'
    },
    {
      'id': 2,
      'idUser': 3,
      'name': 'Farmacia del Ahorro',
      'description':
          'Con el Monedero del Ahorro disfruta de grandes beneficios al realizar tus compras online. Visítanos y descubre las mejores promociones que tenemos para ti.',
      'urlPhotoProfile':
          'https://agenciacentral.mx/images/portafolio/LogosloganaltaFA.jpg',
      'urlBannerProfile':
          'https://retailers.mx/revista/wp-content/uploads/2021/08/farmacias-del-ahorro-e1614015544787.jpg',
      'urlWebSite': 'www.fahorro.com',
      'phoneNumber': '+52 961 576 9875',
      'colonia': 'San Roque',
      'city': 'Tuxtla Gutierrez',
      'zipCode': '29040',
      'latitud': 16.75065066419195,
      'longitud': -93.11498564903523,
      'type': 'Salud y Belleza'
    },
    {
      'id': 3,
      'idUser': 10,
      'name': 'La Chiapanequita',
      'description':
          'Tienda de postres y aguas frescas... Las mejores paletas y helados de la región',
      'urlPhotoProfile':
          'https://firebasestorage.googleapis.com/v0/b/finderpymes-d1b7b.appspot.com/o/pymes%2Fprofile%2Fchiapanequitaprofilejpg.jpg?alt=media&token=3c733cda-a036-44f4-9bdc-5e7dc852adac',
      'urlBannerProfile':
          'https://firebasestorage.googleapis.com/v0/b/finderpymes-d1b7b.appspot.com/o/pymes%2Fprofile%2Fchiapanequitabanner.jpg?alt=media&token=791bc5c6-cf31-4771-bee5-b3543dfc1980',
      'urlWebSite':
          'https://www.facebook.com/people/Estudiantina-Claro-de-Luna/100076540765123/',
      'phoneNumber': '+52 968 130 5369',
      'colonia': 'San Roque',
      'city': 'Tuxtla Gutierrez',
      'zipCode': '29000',
      'latitud': 16.749807412536327,
      'longitud': -93.11348239452134,
      'type': 'Alimentos y Bebidas'
    },
    {
      'id': 4,
      'idUser': 12,
      'name': 'La Chiapanequita',
      'description':
          'Tienda de postres y aguas frescas... Las mejores paletas y helados de la región',
      'urlPhotoProfile':
          'https://firebasestorage.googleapis.com/v0/b/finderpymes-d1b7b.appspot.com/o/pymes%2Fprofile%2Fchiapanequitaprofilejpg.jpg?alt=media&token=3c733cda-a036-44f4-9bdc-5e7dc852adac',
      'urlBannerProfile':
          'https://firebasestorage.googleapis.com/v0/b/finderpymes-d1b7b.appspot.com/o/pymes%2Fprofile%2Fchiapanequitabanner.jpg?alt=media&token=791bc5c6-cf31-4771-bee5-b3543dfc1980',
      'urlWebSite':
          'https://www.facebook.com/people/Estudiantina-Claro-de-Luna/100076540765123/',
      'phoneNumber': '+52 968 130 5369',
      'colonia': 'San Roque',
      'city': 'Tuxtla Gutierrez',
      'zipCode': '29000',
      'latitud': 16.749807412536327,
      'longitud': -93.11348239452134,
      'type': 'Alimentos y Bebidas'
    },
    {
      'id': 5,
      'idUser': 13,
      'name': 'La Chiapanequita',
      'description':
          'Tienda de postres y aguas frescas... Las mejores paletas y helados de la región',
      'urlPhotoProfile':
          'https://firebasestorage.googleapis.com/v0/b/finderpymes-d1b7b.appspot.com/o/pymes%2Fprofile%2Fchiapanequitaprofilejpg.jpg?alt=media&token=3c733cda-a036-44f4-9bdc-5e7dc852adac',
      'urlBannerProfile':
          'https://firebasestorage.googleapis.com/v0/b/finderpymes-d1b7b.appspot.com/o/pymes%2Fprofile%2Fchiapanequitabanner.jpg?alt=media&token=791bc5c6-cf31-4771-bee5-b3543dfc1980',
      'urlWebSite':
          'https://www.facebook.com/people/Estudiantina-Claro-de-Luna/100076540765123/',
      'phoneNumber': '+52 968 130 5369',
      'colonia': 'San Roque',
      'city': 'Tuxtla Gutierrez',
      'zipCode': '29000',
      'latitud': 16.749807412536327,
      'longitud': -93.11348239452134,
      'type': 'Alimentos y Bebidas'
    },
  ];



  List<Map<String, dynamic>> get listPymes => _listPymes;

  bool? _consumerHasAnPyme;
  bool? get consuemerHasAnPyme => _consumerHasAnPyme;
  int get lengthList => _listPymes.length; 

  Map<String, dynamic>? usersPyme(ConsumerProvider consumerProvider) {
    for (var pyme in _listPymes) {
      if (consumerProvider.loggedInConsumer!.id == pyme['idUser']) {
        pyme;
        return pyme;
      }
    }
    return null;
  }

  String addPyme(Map<String, dynamic> newpyme) {
    int antesDe = _listPymes.length;
    _listPymes.add(newpyme);
    if (antesDe == _listPymes.length) {
      return 'ERROR';
    }
    return 'EXITO';
  }

  void checkIfTheConsumerHasAnPyme(ConsumerProvider consumerProvider) {
    for (var pyme in _listPymes) {
      if (consumerProvider.loggedInConsumer!.id == pyme['idUser']) {
        _consumerHasAnPyme = true;
        notifyListeners();
        break;
      }
    }
  }
}
