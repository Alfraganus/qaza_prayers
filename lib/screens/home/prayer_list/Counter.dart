import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:provider/provider.dart';
import 'package:qaza_tracker/Shortcuts.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../firebase/FireCloud.dart';
import '../../../providers/PrayerProvider.dart';


class Counter22 extends StatelessWidget {
  const Counter22({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if(FirebaseAuth.instance.currentUser == null){
      Modular.to.navigate('/login');
    }
    final argument = (ModalRoute.of(context)?.settings.arguments ?? <String, dynamic>{}) as Map;
    var inreasePrayer = argument['quantity'];
    var provider = Provider.of<Prayer>(context, listen: true);
    var getPrayer = provider.getPrayer(argument['prayer_type']);
    return Scaffold(
      appBar: AppBar(
        title: Text('Hisoblagich'),
      ),
      backgroundColor: HexColor('#110055'),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text('Shu kungacha bo\'lgan ${argument['prayer_type']} namozi adadi',
          textAlign: TextAlign.center, style: TextStyle(
              fontSize: 24,
              color: Colors.white,
              fontFamily: 'Montserrat'
            ),),
          setHeight(20),
          Stack(
            children: [
              Align(
                alignment: Alignment.center,
                child: Image.asset('assets/images/frame2.png',width: 300,height: 200,)
              ),
              Positioned(
                left: MediaQuery.of(context).size.width*0.45,
                top: 80,
                child: Text(getPrayer.toString(), style: TextStyle(
                  color: Colors.white,
                  fontSize: 26
                ),),
              )
            ],
          ),
          Padding(
            padding: EdgeInsets.only(top: 30),
            child: SizedBox(
              width: double.infinity,
              child: Row(
                children: [
                  Flexible(
                    child: ElevatedButton(
                      child: Text('-', style: TextStyle(
                        color: Colors.white
                      ),),
                      onPressed:() async {
                        provider.setPrayerByOne(
                            argument['prayer_type'],
                            inreasePrayer,
                            argument['document'],
                            false
                        );
                      },
                      style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(22)),
                          minimumSize: Size.fromHeight(48),
                          primary: HexColor('#C70039'),
                          padding: EdgeInsets.symmetric(horizontal: 50, vertical: 20),
                          textStyle:
                          TextStyle(fontSize: 30, fontWeight: FontWeight.bold)),
                    ),
                  ),
                  Flexible(
                    child: ElevatedButton(
                      child: Text('+', style: TextStyle(
                          color: Colors.white
                      ),),
                      onPressed:() async {
                        provider.setPrayerByOne(
                            argument['prayer_type'],
                            inreasePrayer,
                            argument['document'],
                            true
                        );
                      },
                      style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(22)),
                          minimumSize: Size.fromHeight(48),
                          primary: Colors.green,
                          onSurface: Colors.green,
                          onPrimary: Colors.white,
                          padding: EdgeInsets.symmetric(horizontal: 50, vertical: 20),
                          textStyle:TextStyle(fontSize: 30, fontWeight: FontWeight.bold)
                      ),
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      )
    );
  }
}
