import 'package:flutter/material.dart';

class ImageGirl extends StatelessWidget {
  const ImageGirl({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      padding: EdgeInsets.only(top: 91),
      child: Image.asset('assets/images/joynamiz.png',width: 300,height: 200,),
    );
  }
}
