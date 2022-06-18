import 'dart:core';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:shared_preferences/shared_preferences.dart';


Future<int?> getPrayerInfo(prayerType) async {
  SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
  dynamic userEmail = sharedPreferences.get('userEmail');
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
Future<dynamic?> testcha() async {
  SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
  dynamic userEmail = sharedPreferences.get('userEmail');
  return userEmail;
}
void sendUserDataToFireCloud(PrayerType,OrderPrayer,email) async{
  var db = FirebaseFirestore.instance;

  db.collection("users_prayer")
      .doc("${OrderPrayer}_${email}_${PrayerType}").set({
      "order": OrderPrayer+1,
      "prayerType": StringExtension(PrayerType).capitalize(),
      "times":0,
      "user": email,
  }, SetOptions(merge: true));
}


void writeCloud(email)
{
  var arr = ['bomdod','peshin','asr','shom','xufton'];
  for(var i = 0; i<=5;i++) {
    sendUserDataToFireCloud(arr[i],i,email);
  }
}


extension StringExtension on String {
  String capitalize() {
    return "${this[0].toUpperCase()}${this.substring(1).toLowerCase()}";
  }
}

void updatePrayerCloud(document_id,times) {
  CollectionReference prayer = FirebaseFirestore.instance.collection('users_prayer');
  prayer.doc(document_id).update( <String, dynamic>{
    "times":times,
  });
}

dynamic getPrayersByUserId(email) {
  var test = testcha();
 return FirebaseFirestore.instance
      .collection('users_prayer')
      .where("user",isEqualTo:email)
      .snapshots();
}