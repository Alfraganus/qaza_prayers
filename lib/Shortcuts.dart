import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:flash/flash.dart';

Color loginColor = HexColor('#ffffff');

Widget setHeight(double height) {
 return SizedBox(height: height);
}

void showTopFlash(context,errorMessage) {
  showFlash(
    context: context,
    duration: const Duration(seconds: 2),
    persistent: true,
    builder: (_, controller) {
      return Flash(
        controller: controller,
        backgroundColor: Colors.white,
        brightness: Brightness.light,
        barrierColor: Colors.black38,
        barrierDismissible: true,
        behavior: FlashBehavior.fixed,
        position: FlashPosition.top,
        child: FlashBar(
          title: Text('Xatolik bor!'),
          content: Text(errorMessage),

        ),
      );
    },
  );
}