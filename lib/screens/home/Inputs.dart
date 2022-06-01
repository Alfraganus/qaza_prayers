import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:qaza_tracker/Shortcuts.dart';

class Inputs extends StatelessWidget {
  const Inputs({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20 ),
      child: Column(
        children: [
          const TextField(
            style: TextStyle(
              color: Colors.white
            ),
            decoration: InputDecoration(
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
              hintText: 'Your Email',
              hintStyle: TextStyle(
                  fontSize: 14.0, color: Colors.white,
              ),
            ),
          ),
          setHeight(16),
          const TextField(
            style: TextStyle(
                color: Colors.white
            ),
            decoration: InputDecoration(
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

              hintText: 'Your password',
              hintStyle: TextStyle(
                fontSize: 14.0, color: Colors.white,
              ),
            ),
          ),
          setHeight(25),
          ElevatedButton(
            child: Text('Log in'),
            onPressed: () async {
              try {
                // await FirebaseAuth.instance.signOut();
                final response = await FirebaseAuth.instance.signInWithEmailAndPassword(
                    email: 'alfra@test.uz',
                    password: '123456'
                );
               final auth =  FirebaseAuth.instance
                    .authStateChanges()
                    .listen((User? user) {
                  if (user == null) {
                    print('User is currently signed out!');
                  } else {
                    print('User is signed in!');
                  }
                });


              print(auth);
              } on FirebaseAuthException catch (e) {
                if (e.code == 'user-not-found') {
                  print('No user found for that email.');
                } else if (e.code == 'wrong-password') {
                  print('Wrong password provided for that user.');
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
        ],
      ),
    );
  }
}
