import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Prayer with ChangeNotifier {

  int _bomdod = 0;
  int _peshin = 0;
  int _asr = 0;
  int _shom = 0;
  int _xufton = 0;

  int get bomdod => _bomdod;
  int get peshin => _peshin;
  int get asr => _asr;
  int get shom => _shom;
  int get xufton => _xufton;

  void prayer(prayerType) async{
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    dynamic userEmail = sharedPreferences.get('userEmail');
    var collection = "${userEmail}_${prayerType}";
    var db = FirebaseFirestore.instance;
    var prayerCount = 0;
    final docRef = db.collection("users_prayer").doc(collection);
    docRef.get().then(
          (DocumentSnapshot doc) {
        if(doc.data() == null) {
          return prayerCount;
          // print('data does not exist');
        } else {
          final data = doc.data() as Map<String, dynamic>;
          prayerCount = 5;
          return _bomdod = data['times'];
        }
      },
      onError: (e) => print("Error getting document: $e"),
    );
    ChangeNotifier();
  }

}