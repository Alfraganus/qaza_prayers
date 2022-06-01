import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:qaza_tracker/screens/home/homeMain.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'app_module.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: const FirebaseOptions(
      apiKey: 'AIzaSyDxKKYaaaQunICA_pZg_Ew_XfTOsQW1jrU',
      appId: '1:24199581709:android:5f229a990eb571ae884544',
      messagingSenderId: '24199581709',
      projectId: 'qaza-prayers-tracker',
      storageBucket: 'qaza-prayers-tracker.appspot.com',
    ),
  );
  // await FirebaseAuth.instance.useAuthEmulator('localhost', 9099);
   runApp(
      ModularApp(
          module: AppModular(),
          child: QazaTrakerStart()
      )
  );
}

class QazaTrakerStart extends StatelessWidget {
  const QazaTrakerStart({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;



  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body:SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
          child: HomeMain()
      ),
    );
  }
}
