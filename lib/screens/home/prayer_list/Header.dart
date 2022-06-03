import 'package:flutter/material.dart';

class Header extends StatelessWidget {
  const Header({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Text('Assalomu Aleykum',style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w900
          ),)
        ],
      ),
    );
  }
}
