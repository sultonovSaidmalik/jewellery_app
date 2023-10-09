import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jewellery_app/src/common/service/local_dara_service.dart';

import 'firebase_options.dart';
import 'src/common/service/service_locator.dart';
import 'src/screens/bloc_server/bloc_server.dart';

Future<void> appInitialize() async {
  await LocalDataService.init();
  Bloc.observer = BlocObserverListener();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await setupLocator();
}