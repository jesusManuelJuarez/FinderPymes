// ignore_for_file: avoid_print

import 'package:http/http.dart';

import '../../domain/entities/consumer_entity.dart';
import 'dart:convert';

abstract class ConsumerRemoteDataSource {
  Future<String> createConsumer(ConsumerData consumer);
  Future<List<ConsumerData>> getConsumer();
  Future<ConsumerData> loginConsumer(ConsumerData consumer);
}

class ConsumerRemoteDataSoucerImp implements ConsumerRemoteDataSource {
  final String _baseUrl = 'http://50.16.168.171';

  final List<ConsumerData> _consumers = [
    ConsumerData(
      id: 1,
      name: 'Alonso Anselmo Gomez Sanchez',
      email: '201276@ids.upchiapas.edu.mx',
      password: 'Annita12',
      idPlantFP: 1,
    ),
    ConsumerData(
      id: 2,
      name: 'Yhander Gamaliel Diaz Perez',
      email: '201284@ids.upchiapas.edu.mx',
      password: 'Yhander C101',
      idPlantFP: 2,
    ),
    ConsumerData(
      id: 3,
      name: 'Jesus Manuel Juarez Acosta',
      email: '193201@ids.upchiapas.edu.mx',
      password: 'anaForLoving',
      idPlantFP: 3,
    ),
  ];

  @override
  Future<String> createConsumer(ConsumerData consumer) async {
    _consumers.add(ConsumerData(
      id: consumer.id,
      name: consumer.name,
      email: consumer.email,
      password: consumer.password,
      idPlantFP: consumer.idPlantFP,
    ));

    return 'Se registro al Consumer';
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
  Future<ConsumerData> loginConsumer(ConsumerData consumer) async {
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
        if (consumer.email == cons.email &&
            consumer.password == cons.password) {
          return cons;
        }
      }

      throw Exception('No se encontro al usuario');
    } catch (e) {
      throw Exception('Failed to login: $e');
    }
  }
}
