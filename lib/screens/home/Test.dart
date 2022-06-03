import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Test extends StatelessWidget {
  const Test({Key? key}) : super(key: key);
  static const String routeName = "/test";
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: ElevatedButton(
        child: Text('test'),
        onPressed: ()  async{
          await FirebaseAuth.instance.signOut();
      },
      ),
    );
  }
}
