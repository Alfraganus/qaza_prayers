import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:qaza_tracker/screens/home/Inputs.dart';
import 'package:qaza_tracker/screens/home/homeMain.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'app_module.dart';
import 'package:firebase_core/firebase_core.dart';

import 'firebase/FireBaseAuth.dart';
import 'firebase/FireCloud.dart';

void main() async {
  await Firebase.initializeApp(
    options: const FirebaseOptions(
      apiKey: 'AIzaSyDxKKYaaaQunICA_pZg_Ew_XfTOsQW1jrU',
      appId: '1:24199581709:android:5f229a990eb571ae884544',
      messagingSenderId: '24199581709',
      projectId: 'qaza-prayers-tracker',
      storageBucket: 'qaza-prayers-tracker.appspot.com',
    ),
  );

  SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
  pageRoute();
  getPrayerInfo('bomdod');
  // getPrayerInfo();
  WidgetsFlutterBinding.ensureInitialized();

  // print(boolCheckUser());
   runApp(
      ModularApp(
          module: AppModular(),
          child: AppWidget()
      )
  );
}

class AppWidget extends StatelessWidget {
  Widget build(BuildContext context){
    return MaterialApp.router(
      title: 'My Smart App',
      theme: ThemeData(primarySwatch: Colors.blue),
      routeInformationParser: Modular.routeInformationParser,
      routerDelegate: Modular.routerDelegate,
    ); //added by extension
  }
}


class QazaTrakerStart extends StatelessWidget {
  const QazaTrakerStart({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('app title'),
      ),
      body:SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
          child: HomeMain()
      ),
    );
  }
}
