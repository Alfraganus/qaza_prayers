import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:qaza_tracker/screens/home/register/ImageGirl.dart';
import 'package:qaza_tracker/screens/home/register/Inputs.dart';
import 'package:qaza_tracker/screens/home/register/WelcomeText.dart';

import '../../../Shortcuts.dart';

class RegisterMain extends StatefulWidget {
  const RegisterMain({Key? key}) : super(key: key);
  @override
  State<RegisterMain> createState() => _RegisterMainState();
}

class _RegisterMainState extends State<RegisterMain> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width * 100 ,
        height:800 ,
       color: HexColor('#0A0171'),
        child: Column(
          children: [
            ImageGirl(),
            setHeight(51),
            WelcomeText(),
            setHeight(38),
            Inputs()
          ],
        ),
      ),
    );
  }
}
