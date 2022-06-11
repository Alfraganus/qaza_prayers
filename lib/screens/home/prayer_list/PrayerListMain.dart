import 'package:flutter/material.dart';
import 'package:qaza_tracker/screens/home/prayer_list/Header.dart';
import 'TabView.dart';

class PrayerListMain extends StatelessWidget {
  const PrayerListMain({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text('Ibodatlar'),
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
      ),
    );
  }
}
