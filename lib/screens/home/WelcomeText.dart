import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import '../../Shortcuts.dart';

class WelcomeText extends StatelessWidget {
  const WelcomeText({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Text('Xush kelibsiz birodar!',style: TextStyle(
            color: loginColor,
            fontSize: 20,
            fontWeight: FontWeight.w800
          ),),
          setHeight(41),
          Text('Ibodatlar uchun qaydnoma',style: TextStyle(
              color: loginColor,
              fontSize: 16,
          ),),
          setHeight(38), 
        ],
      ),
    );
  }
}
