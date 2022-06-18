import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:qaza_tracker/Shortcuts.dart';
import 'package:email_validator/email_validator.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../firebase/FireCloud.dart';
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
              hintText: 'Email kiriting',
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

              hintText: 'Parol kiriting',
              hintStyle: TextStyle(
                fontSize: 14.0, color: Colors.white,
              ),
            ),
          ),
          setHeight(25),
          ElevatedButton(
            child: Text('Ro\'yhattan o\'tish'),
            onPressed: () async {
              // await FirebaseAuth.instance.signOut();
              if (login.text.isEmpty || !EmailValidator.validate(login.text)) {
                return showTopFlash(context,'Email xato kiritilgan yoki b\'osh qoldirilgan!');
              } else {
                try {
                  await FirebaseAuth.instance.createUserWithEmailAndPassword(
                      email: login.text,
                      password: password.text
                  );
                  Modular.to.pushNamed('/');
                  writeCloud(login.text);

                } on FirebaseAuthException catch (e) {
                  if (e.code == 'weak-password') {
                    showTopFlash(context,'Iltimos, qiyinroq parol tanlang');
                  } else if (e.code == 'email-already-in-use') {
                    showTopFlash(context,'Ushbu email bilan oldin hisob ochilgan');
                  }
                } catch (e) {
                  print(e);
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
        ],
      ),
    );
  }
}


void pageRoute() async {
  SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
  await sharedPreferences.setString("userEmail", 'alfra@test.uz');
}
