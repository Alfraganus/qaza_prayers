import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_modular/flutter_modular.dart';



boolCheckUser() {


  FirebaseAuth.instance.authStateChanges().listen((User? user) {
    print(user?.refreshToken);
    if (user?.refreshToken==null) {
      print(user);
      return Modular.to.navigate('/login');
    }

    print(user);
  });
}


