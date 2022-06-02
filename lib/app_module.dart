import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:qaza_tracker/screens/home/Test.dart';
import 'package:qaza_tracker/screens/home/homeMain.dart';

import 'main.dart';


class AppModular extends Module {
  @override
  List<Bind> get binds => [];

  @override
  List<ModularRoute> get routes => [
    ChildRoute('/', child: (context, args) => MyHomePage()),
    ChildRoute('/test', child: (context, args) => Test()),
  ];
}
