import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Prayer with ChangeNotifier {

  int _bomdod = 0;
  int _peshin = 0;
  int _asr = 0;
  int _shom = 0;
  int _xufton = 0;


  int get Bomdod => _bomdod;
  int get Peshin => _peshin;
  int get Asr => _asr;
  int get Shom => _shom;
  int get Xufton => _xufton;

  void setPrayer(prayer, quantity,bool increment) {
    switch (prayer) {
      case 'Bomdod':
        increment?
        _bomdod ++ :
        _bomdod = quantity;
        notifyListeners();
        break;
      case 'Peshinn':
        increment?
        _peshin ++:
        _peshin = quantity;
        notifyListeners();
        break;
      case 'Asr':
        increment?
        _asr++:
        _asr = quantity;
        notifyListeners();
        break;
      case 'Shom':
        increment?
        _shom++:
        _shom = quantity;
        notifyListeners();
        break;
      case 'Xufton':
        increment?
        _xufton++:
        _xufton = quantity;
        notifyListeners();
        break;
    }
  }


   int getPrayer(prayer) {
    var prayerType;
    switch (prayer) {
      case 'Bomdod':
         prayerType = Bomdod;
         break;
      case 'Peshin':
        prayerType = Peshin;
        break;
      case 'Asr':
        prayerType = Asr;
        break;
      case 'Shom':
        prayerType = Shom;
        break;
      case 'Xufton':
        prayerType = Xufton;
        break;

    }
    return prayerType;
  }

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