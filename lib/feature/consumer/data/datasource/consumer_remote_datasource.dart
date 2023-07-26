// ignore_for_file: avoid_print, unused_import, unused_field

import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:http/http.dart';

import '../../domain/entities/consumer_entity.dart';
import 'dart:convert';

abstract class ConsumerRemoteDataSource {
  Future<String> createConsumer(ConsumerData consumer);
  Future<List<ConsumerData>> getConsumer();
  Future<ConsumerData> loginConsumer(String email, String password);
  Future<String> uploadPhoto(File image);
}

class ConsumerRemoteDataSoucerImp implements ConsumerRemoteDataSource {
  FirebaseStorage storage = FirebaseStorage.instance;
  final db = FirebaseFirestore.instance;
  final String _baseUrl = 'http://50.16.168.171';

  final List<ConsumerData> _consumers = [
    ConsumerData(
      id: 1,
      name: 'Alonso Anselmo Gomez Sanchez',
      email: '201276@ids.upchiapas.edu.mx',
      urlPhoto: '',
      password: 'Annita12',
      idPlantFP: 1,
    ),
    ConsumerData(
      id: 2,
      name: 'Yhander Gamaliel Diaz Perez',
      email: '201284@ids.upchiapas.edu.mx',
      urlPhoto:
          'https://i.pinimg.com/564x/80/93/2e/80932e57b837a4df10e9f928894d3b05.jpg',
      password: 'YhanderC101',
      idPlantFP: 2,
    ),
    ConsumerData(
      id: 3,
      name: 'Jesus Manuel Juarez Acosta',
      email: '193201@ids.upchiapas.edu.mx',
      urlPhoto: '',
      password: 'anaForLoving',
      idPlantFP: 3,
    ),
    ConsumerData(
      id: 4,
      name: 'Gama Diaz Perez',
      email: 'asd@asd.asd',
      urlPhoto:
          'https://i.pinimg.com/564x/6f/f7/84/6ff784a27af1c40959809255331880ad.jpg',
      password: 'Qwerty1',
      idPlantFP: 4,
    ),
  ];

  @override
  Future<String> createConsumer(ConsumerData consumer) async {
    _consumers.add(ConsumerData(
      id: _consumers.length + 1,
      name: consumer.name,
      email: consumer.email,
      urlPhoto: consumer.urlPhoto,
      password: consumer.password,
      idPlantFP: consumer.idPlantFP,
    ));

    return 'REGISTRO EXITOSO';
  }

  @override
  Future<List<ConsumerData>> getConsumer() async {
    // final response = await get(Uri.parse('$_baseUrl/user/'));
    // if (response.statusCode == 200) {
    //   final body = utf8.decode(response.bodyBytes);
    //   final jsonBody = jsonDecode(body);

    //   if (jsonBody['status'] != "success") {
    //     throw Exception(
    //         'Failed to load consumers. Status: ${jsonBody['status']}');
    //   }

    //   final consumers = (jsonBody['info'] as List)
    //       .map((consumer) => ConsumerData.fromJson(consumer))
    //       .toList();

    //   return consumers;
    // } else {
    //   throw Exception(
    //       'Failed to load consumers. Status code: ${response.statusCode}');
    // }

    return _consumers;
  }

  @override
  Future<ConsumerData> loginConsumer(String email, String password) async {
    try {
      // Response response = await post(Uri.parse('http://50.16.168.171/login'),
      //     body: {"email": consumer.email, "password": consumer.password});

      // if (response.statusCode >= 200 && response.statusCode < 300) {
      //   print(response.body);
      //   var data = jsonDecode(response.body.toString());

      //   if (data['status'] != "success") {
      //     throw Exception('Failed to login. Status: ${data['status']}');
      //   }

      //   return ConsumerData.fromJson(data['Data']);
      // } else {
      //   throw Exception(
      //       'Failed to login. Status code: ${response.statusCode}, Response body: ${response.body}');
      // }
      for (var cons in _consumers) {
        if (email == cons.email && password == cons.password) {
          return cons;
        }
      }

      throw Exception('No se encontro al usuario');
    } catch (e) {
      throw Exception('Failed to login: $e');
    }
  }

  @override
  Future<String> uploadPhoto(File image) async {
    final String namefield = image.path.split('/').last;
    final Reference ref = storage.ref().child('photo_profile').child(namefield);
    final UploadTask uploadTask = ref.putFile(image);
    final TaskSnapshot snapshot = await uploadTask.whenComplete(() => true);
    final String urlPhoto = await snapshot.ref.getDownloadURL();
    return urlPhoto;
    // return '';
  }
}
