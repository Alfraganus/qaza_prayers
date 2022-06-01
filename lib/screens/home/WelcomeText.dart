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
          Text('Welcome Back!',style: TextStyle(
            color: loginColor,
            fontSize: 20,
            fontWeight: FontWeight.w800
          ),),
          setHeight(41),
          Text('Please log into your existing account!',style: TextStyle(
              color: loginColor,
              fontSize: 16,
          ),),
          setHeight(38), 
        ],
      ),
    );
  }
}
