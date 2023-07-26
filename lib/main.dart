import 'package:finder_pymes/feature/consumer/data/datasource/consumer_remote_datasource.dart';
import 'package:finder_pymes/feature/consumer/data/repository/consumer_repository_imp.dart';
import 'package:finder_pymes/feature/consumer/domain/usecases/create_consumer_usecase.dart';
import 'package:finder_pymes/feature/consumer/domain/usecases/get_consumer_usecase.dart';
import 'package:finder_pymes/feature/consumer/domain/usecases/login_consumer_usecase.dart';
import 'package:finder_pymes/feature/consumer/domain/usecases/upload_photo_consumer_usecase.dart';
import 'package:finder_pymes/feature/consumer/presentation/provider/consumer_provider.dart';
import 'package:finder_pymes/feature/pymes/presentation/providers/widget_pymes_provider.dart';
import 'package:finder_pymes/feature/post/presentation/pages/init_view.dart';
import 'package:finder_pymes/feature/pymes/presentation/pages/image_picker_provider.dart';
import 'package:finder_pymes/feature/pymes/presentation/pages/stepper_state.dart';
import 'package:finder_pymes/restart_app.dart';
import 'package:finder_pymes/settings/size_responsive.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
// import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  // WidgetsFlutterBinding.ensureInitialized();
  // await Firebase.initializeApp(
  //   options: DefaultFirebaseOptions.currentPlatform,
  // );

  final consumerRemoteDataSource = ConsumerRemoteDataSoucerImp();
  final consumerRepository =
      ConsumerRepositoryImp(consumerRemoteDataSource: consumerRemoteDataSource);
  final getConsumerUsecase =
      GetConsumerUsecase(consumerRepository: consumerRepository);

  final loginConsumerUsecase =
      LoginConsumerUsecase(consumerRepository: consumerRepository);

  final createConsumerUsecase = CreateConsumerUsecase(consumerRepository);

  final uploadPhotoConsumerUsecase = UploadPhotoConsumerUsecase(consumerRepository);

  runApp(RestartWidget(
    child: MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => ConsumerProvider(
              getConsumerUsecase, loginConsumerUsecase, createConsumerUsecase, uploadPhotoConsumerUsecase),
        ),
        ChangeNotifierProvider(
          create: (context) => StepperState(),
        ),
        ChangeNotifierProvider(
          create: (context) => ImagePickerProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => CategoryProvider(),
        ),
      ],
      child: const MyApp(),
    ),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    SizeResponsize(context);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'FinderPymes',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      // home: const PaginaPruebas(),
      home: const InitView(),
    );
  }
}
