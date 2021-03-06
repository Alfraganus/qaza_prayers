import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:provider/provider.dart';
import 'package:qaza_tracker/Shortcuts.dart';
import 'package:email_validator/email_validator.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../providers/PrayerProvider.dart';




class Inputs extends StatelessWidget {
  const Inputs({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController login = new TextEditingController();
    TextEditingController password = new TextEditingController();
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20 ),
      child: Column(
        children: [
          TextFormField(
            controller: login,
            style: const TextStyle(
              color: Colors.white
            ),
            decoration: const InputDecoration(
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.white),
                borderRadius: BorderRadius.all(Radius.circular(16)),
              ),
              contentPadding: EdgeInsets.symmetric(vertical: 24,horizontal: 20),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(16),),
                borderSide:  BorderSide(
                    color: Colors.white,
                      width: 1
                )
              ),
              hintText: 'Login',
              hintStyle: TextStyle(
                  fontSize: 14.0, color: Colors.white,
              ),
            ),
          ),
          setHeight(16),
           TextFormField(
            controller: password,
             // validator: (value) => EmailValidator.validate(value) ? null : "Please enter a valid email",
            style: const TextStyle(
                color: Colors.white
            ),
            decoration: const InputDecoration(
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.white),
                borderRadius: BorderRadius.all(Radius.circular(16)),
              ),
              contentPadding: EdgeInsets.symmetric(vertical: 24,horizontal: 20),
              enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(16),),
                  borderSide:  BorderSide(
                      color: Colors.white,
                      width: 1
                  )
              ),

              hintText: 'Parol',
              hintStyle: TextStyle(
                fontSize: 14.0, color: Colors.white,
              ),
            ),
          ),
          setHeight(25),
          ElevatedButton(
            child: Text('Kirish'),
            onPressed: () async {
              // await FirebaseAuth.instance.signOut();
              if (login.text.isEmpty || !EmailValidator.validate(login.text)) {
                showTopFlash(context,'Iltimos, ma\'lumotlarni kiriting!');
                // Modular.to.pushNamed('/');
                // return showTopFlash(context,'Email xato kiritilgan yoki bosh qoldirilgan!');
              } else {
                try {
                  await FirebaseAuth.instance.signInWithEmailAndPassword(
                      email: login.text,
                      password: password.text
                  );
                  Provider.of<Prayer>(context, listen: false).setUserEmail(login.text);
                  pageRoute(login.text);
                  Modular.to.pushNamedAndRemoveUntil('/prayerMain',  (Route<dynamic> route) => false);

                  // Navigator.of(context).p
                  // ushNamedAndRemoveUntil('/prayerMain', (Route<dynamic> route) => false);
                  // Modular.to.pushNamed('/prayerMain');
                  // Modular.to.pushNamedAndRemoveUntil('/prayerMain',  (route)=>true);
                  // Modular.to.pushNamed('/prayerMain');
                } on FirebaseAuthException catch (e) {
                  if (e.code == 'user-not-found') {
                    showTopFlash(context,'Bunday foydalanuvchi topilmadi');
                  } else if (e.code == 'wrong-password') {
                    showTopFlash(context,'Parol mos kelmadi');
                  }
                }
              }
            },
            style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(22)),
                minimumSize: Size.fromHeight(48),
                primary: HexColor('#2BC990'),
                padding: EdgeInsets.symmetric(horizontal: 50, vertical: 20),
                textStyle:
                TextStyle(fontSize: 30, fontWeight: FontWeight.bold)),
          ),
          setHeight(10),
          ElevatedButton(
            child: Text('Ro\'yhatdan o\'tish'),
            onPressed: () async {
              Modular.to.pushNamed('/register');
            },
            style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(22)),
                minimumSize: Size.fromHeight(48),
                primary: HexColor('#A30000'),
                padding: EdgeInsets.symmetric(horizontal: 50, vertical: 20),
                textStyle:
                TextStyle(fontSize: 30, fontWeight: FontWeight.bold)),
          ),
        ],
      ),
    );
  }
}


void pageRoute(email) async {
  SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
  await sharedPreferences.setString("userEmail",email);
}
