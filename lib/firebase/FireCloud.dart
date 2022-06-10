import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:shared_preferences/shared_preferences.dart';





/*void CreateOrUpdateData() {
  var userEmail = getUserEmail();
  var db = FirebaseFirestore.instance;
  db.collection('users_prayer')
      .doc("${userEmail}_bomdod")
      .set(data, SetOptions(merge: true));
}*/

void getPrayerInfo(prayerType) async {
  SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
  dynamic userEmail = sharedPreferences.get('userEmail');
   var collection = "${userEmail}_${prayerType}";
  var db = FirebaseFirestore.instance;
  int prayerCount = 0;
  final docRef = db.collection("users_prayer").doc("${userEmail}_${prayerType}");
  docRef.get().then(
        (DocumentSnapshot doc) {
          if(doc.data() == null) {
            return print(prayerCount);
            // print('data does not exist');
          } else {
            final data = doc.data() as Map<String, dynamic>;
            prayerCount = 5;
            return print(data);
          }

    },
    onError: (e) => print("Error getting document: $e"),
  );
}

