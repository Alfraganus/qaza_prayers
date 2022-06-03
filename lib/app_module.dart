import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:qaza_tracker/screens/home/Test.dart';
import 'package:qaza_tracker/screens/home/homeMain.dart';
import 'main.dart';

bool isLogined= false;

class AppModular extends Module {
  @override
  List<Bind> get binds => [];
  final auth =  FirebaseAuth.instance
      .authStateChanges()
      .listen((User? user) {
    if (user != null) {
      isLogined = true;
    }
  });
  @override
  List<ModularRoute> get routes => [
    ChildRoute('/', child: (context, args) => Test()),
    ChildRoute('/login', child: (context, args) => MyHomePage()),
  ];
}
