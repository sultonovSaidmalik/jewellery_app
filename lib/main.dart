import 'dart:async';
import 'package:flutter/material.dart';
import 'package:jewellery_app/app_initialize.dart';
import 'app.dart';

void main() => runZoned(() async {
      await appInitialize();
      runApp(const JewelleryApp());
    });
