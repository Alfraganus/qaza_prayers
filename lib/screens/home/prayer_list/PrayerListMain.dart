import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:qaza_tracker/screens/home/prayer_list/Header.dart';
import '../../../main.dart';
import 'TabView.dart';

class PrayerListMain extends StatelessWidget {
  const PrayerListMain({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text('Ibodatlar'),
        actions: <Widget>[
          GestureDetector(
            onTap:() {
              Modular.to.navigate('/login');
              FirebaseAuth.instance.signOut();
            },
            child: Padding(
              padding: EdgeInsets.only(right: 20.0),
              child: Icon(
                Icons.exit_to_app,
              ),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 23,vertical: 40 ),
          child: Column(
            children: [
              Header(),
              TabView()
            ],
          ),
        ),
      )
    );
  }
}
