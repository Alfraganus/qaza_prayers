import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

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
      height: MediaQuery.of(context).size.height * 100 ,
     color: HexColor('#0A0171'),
      child: Text('200'),
    );
  }
}
