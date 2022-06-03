import 'package:flutter/material.dart';
import 'package:qaza_tracker/screens/home/prayer_list/Header.dart';

class PrayerListMain extends StatelessWidget {
  const PrayerListMain({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text('Hello'),
      ),
      body: Column(
        children: [
          Header()
        ],
      ),
    );
  }
}
