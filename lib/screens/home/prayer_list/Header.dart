import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:qaza_tracker/Shortcuts.dart';


class Header2 extends StatefulWidget {
  const Header2({Key? key}) : super(key: key);

  @override
  State<Header2> createState() => _Header2State();
}

class _Header2State extends State<Header2> {

  @override
  Widget build(BuildContext context) {
    return  Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Assalomu Aleykum',style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w500,
              fontFamily: 'Poppins',
              color: HexColor('#8789A3')
          )),
          setHeight(20),
          Text('Gulomjon Sulaymonov',style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.w900,
              color: HexColor('#240F4F')
          ),),
          setHeight(40),
          Image(image: AssetImage('assets/images/islam.webp')),

        ],
      ),
    );
  }
}


class Header extends StatelessWidget {
  const Header({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
           Text('Assalomu Aleykum',style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w500,
            fontFamily: 'Poppins',
            color: HexColor('#8789A3')
          )),
          setHeight(20),
          Text('Gulomjon Sulaymonov',style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.w900,
            color: HexColor('#240F4F')
          ),),
          setHeight(40),
          Image(image: AssetImage('assets/images/islam.webp')),


        ],
      ),
    );
  }
}
