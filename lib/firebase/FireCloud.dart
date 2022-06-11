import 'dart:core';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:shared_preferences/shared_preferences.dart';




/*void CreateOrUpdateData() {
  var userEmail = getUserEmail();
  var db = FirebaseFirestore.instance;
  db.collection('users_prayer')
      .doc("${userEmail}_bomdod")
      .set(data, SetOptions(merge: true));
}*/

Future<int> _execute(Function function) async {
  var prayerType = 'bomdod';
  SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
  dynamic userEmail = sharedPreferences.get('userEmail');
  var collection = "${userEmail}_${prayerType}";
  var db = FirebaseFirestore.instance;
  var prayerCount = 0;
  final docRef = db.collection("users_prayer").doc("${userEmail}_${prayerType}");
  docRef.get().then(
        (DocumentSnapshot doc) {
      if(doc.data() == null) {
        return prayerCount;
        // print('data does not exist');
      } else {
        final data = doc.data() as Map<String, dynamic>;
        prayerCount = 5;
        return data['times'];
      }

    },
    onError: (e) => print("Error getting document: $e"),
  );
  return prayerCount;
}


Future<int?> getPrayerInfo(prayerType) async {
  SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
  dynamic userEmail = sharedPreferences.get('userEmail');
   var collection = "${userEmail}_${prayerType}";
  var db = FirebaseFirestore.instance;
  var prayerCount = 0;
  final docRef = db.collection("users_prayer").doc("${userEmail}_${prayerType}");
  docRef.get().then(
        (DocumentSnapshot doc) {
          if(doc.data() == null) {
            return prayerCount;
            // print('data does not exist');
          } else {
            final data = doc.data() as Map<String, dynamic>;
            prayerCount = 5;
            return data['times'];
          }

    },
    onError: (e) => print("Error getting document: $e"),
  );
}


void sendUserDataToFireCloud(PrayerType,OrderPrayer) async{
  var db = FirebaseFirestore.instance;

  SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
  dynamic userEmail = sharedPreferences.get('userEmail');

  db.collection("users_prayer")
      .doc("${OrderPrayer}_${userEmail}_${PrayerType}").set({
      "order": OrderPrayer,
      "prayerType": StringExtension(PrayerType).capitalize(),
      "times":0,
      "user": userEmail,
  }, SetOptions(merge: true));
}


void writeCloud()
{
  var arr = ['bomdod','peshin','asr','shom','xufton'];
  for(var i = 0; i<=5;i++) {
    sendUserDataToFireCloud(arr[i],i);
  }
}


extension StringExtension on String {
  String capitalize() {
    return "${this[0].toUpperCase()}${this.substring(1).toLowerCase()}";
  }
}