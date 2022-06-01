import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:qaza_tracker/screens/home/Inputs.dart';

import '../../Shortcuts.dart';
import 'ImageGirl.dart';
import 'WelcomeText.dart';

class HomeMain extends StatefulWidget {
  const HomeMain({Key? key}) : super(key: key);

  @override
  State<HomeMain> createState() => _HomeMainState();
}

class _HomeMainState extends State<HomeMain> {
  @override
  Widget build(BuildContext context) {
    return Container(
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
    );
  }
}
