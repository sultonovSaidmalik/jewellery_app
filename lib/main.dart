import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jewellery_app/src/common/service/service_locator.dart';
import 'package:jewellery_app/src/screens/bloc_server/bloc_server.dart';
import 'app.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';


void main() => runZoned(() async{
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = BlocObserverListener();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await setupLocator();
  runApp(const JewelleryApp()); 
});



