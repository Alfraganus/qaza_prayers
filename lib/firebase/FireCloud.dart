import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:shared_preferences/shared_preferences.dart';




Future<void> getUserEmail() async {
  SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
  sharedPreferences.get('userEmail');
}

/*void CreateOrUpdateData() {
  var userEmail = getUserEmail();
  var db = FirebaseFirestore.instance;
  db.collection('users_prayer')
      .doc("${userEmail}_bomdod")
      .set(data, SetOptions(merge: true));
}*/

void getPrayerInfo() {
  var db = FirebaseFirestore.instance;
  final docRef = db.collection("users_prayer").doc("alfra@test.uz_bomdod");
  docRef.get().then(
        (DocumentSnapshot doc) {
      final data = doc.data() as Map<String, dynamic>;
      print(data);
    },
    onError: (e) => print("Error getting document: $e"),
  );
}

