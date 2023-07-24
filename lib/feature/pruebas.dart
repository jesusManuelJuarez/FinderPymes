import 'package:finder_pymes/feature/consumer/domain/entities/consumer_entity.dart';
import 'package:finder_pymes/feature/consumer/presentation/provider/consumer_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PaginaPruebas extends StatelessWidget {
  const PaginaPruebas({super.key});

  @override
  Widget build(BuildContext context) {
    ConsumerProvider consumerProvider = Provider.of<ConsumerProvider>(context);
    ConsumerData consumer = ConsumerData(
      id: 0,
      name: '',
      email: 'yhander@is.com',
      password: 'Maybe12',
      idPlantFP: 0,
    );

    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              ElevatedButton(
                  onPressed: () {
                    consumerProvider.loginConsumer(consumer);
                  },
                  child: const Text('Funciona??')),
              Expanded(
                child: consumerProvider.loggedInConsumer == null
                    ? const Center(
                        child:
                            CircularProgressIndicator()) // Muestra un spinner si los consumidores son nulos
                    : /*  ListView.builder(
                        itemCount: consumerProvider.consumers?.length ?? 0,
                        itemBuilder: (context, index) {
                          return ListTile(
                            title: Text(
                              consumerProvider.consumers![index].name,
                            ),
                            subtitle: Text(consumerProvider.consumers![index].id
                                .toString()),
                          );
                        },
                      ), */
                    ListTile(
                        title: Text(consumerProvider.loggedInConsumer!.name),
                        subtitle: Text(
                          consumerProvider.loggedInConsumer!.id.toString(),
                        ),
                      ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
